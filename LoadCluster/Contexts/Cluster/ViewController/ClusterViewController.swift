//
//  ViewController.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import UIKit
import RxSwift
import GoogleMaps

struct ClusterNavigation {
    var markerDetailPressed: (() -> Void)
}

class ClusterViewController: UIViewController, GMUClusterManagerDelegate,
GMSMapViewDelegate {
    
    @IBOutlet var mapView: GMSMapView!
    
    private var clusterManager: GMUClusterManager!
    var viewModel: ClusterVM!
    var navigation: ClusterNavigation?
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var refreshBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.bringSubview(toFront: refreshBtn)
        getMarkersData()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func getMarkersData() {
        viewModel.clusterList().subscribe(onNext: { result in
            let iconGenerator = GMUDefaultClusterIconGenerator()
            let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
            let renderer = GMUDefaultClusterRenderer(mapView: self.mapView,
                                                     clusterIconGenerator: iconGenerator)
            self.clusterManager = GMUClusterManager(map: self.mapView, algorithm: algorithm,
                                                    renderer: renderer)
            
            self.generateClusterItems(establishment: result)
            
            renderer.delegate = self
            self.clusterManager.cluster()
            self.clusterManager.setDelegate(self, mapDelegate: self)
        }).disposed(by: disposeBag)
    }
    
    
    private func generateClusterItems(establishment: [Establishment]) {
        
        establishment.forEach {
            let lat = $0.location.lat
            let lng = $0.location.long
            let name = $0.name
            let description = $0.description
            let item =
                POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name, description: description)
            
            clusterManager.add(item)
        }
        
    }
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                                 zoom: mapView.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(newCamera)
        mapView.moveCamera(update)
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        viewModel.selectedMarkerLat = marker.position.latitude
        viewModel.selectedMarkerLong = marker.position.longitude
        navigation?.markerDetailPressed()
    }
    
    @IBAction func refreshBtnPressed(_ sender: Any) {
        mapView.clear()
        getMarkersData()
    }
    
}

extension ClusterViewController: GMUClusterRendererDelegate {
    
    func renderer(_ renderer: GMUClusterRenderer, didRenderMarker marker: GMSMarker) {
        if let userData = marker.userData {
            print(userData)
        }
        guard let markerData = marker.userData as? POIItem else { return }
        
        
        marker.title = markerData.name
        marker.snippet = markerData.markerDescription
    }
}

extension ClusterViewController: Injectable {
    
    func inject(_ viewModel: ClusterVM) {
        self.viewModel = viewModel
    }
    
    func assertDependencies() {
        assert(viewModel != nil)
    }
}

