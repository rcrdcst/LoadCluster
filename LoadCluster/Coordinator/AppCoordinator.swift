//
//  MainCoordinator.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation

class AppCoordinator {
    let window: UIWindow
    
    var rootNavigationController: UINavigationController?
    let service: ClusterService = ClusterService()
    var viewModel: ClusterVM
    
    init(window: UIWindow) {
        viewModel = ClusterVM(handler: service)
        self.window = window
    }
    
    func start() {
        showHome()
    }
    
    private func showHome() {
        let rootViewController = ClusterViewController.instantiateFromStoryboard("Home")
        
        rootViewController.inject(viewModel)
        rootViewController.navigation = ClusterNavigation(markerDetailPressed: {
            self.goToClusterDetail()
        })
        rootNavigationController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = rootNavigationController
    
    }
    
    private func goToClusterDetail() {
        let vc = ClusterDetailViewController.instantiateFromStoryboard("Home")

        vc.inject(viewModel)
        rootNavigationController?.pushViewController(vc, animated: true)
    }
    
    
}
