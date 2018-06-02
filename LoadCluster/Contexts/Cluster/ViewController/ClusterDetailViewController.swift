//
//  ClusterDetailViewController.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import UIKit

class ClusterDetailViewController: UIViewController {

    @IBOutlet weak var markerTitleLabel: UILabel!
    @IBOutlet weak var markerDescriptionLabel: UILabel!
    private var markerInfo: Establishment?
    
    var viewModel: ClusterVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        markerInfo = viewModel.getEstablishmentData()
        
        
        if let markerName = markerInfo?.name {
            markerTitleLabel.text = markerName
        } else {
            markerTitleLabel.text = ""
        }
        
        if let markerDescription = markerInfo?.description {
            markerDescriptionLabel.text = markerDescription
        } else {
            markerDescriptionLabel.text = ""
        }

        // Do any additional setup after loading the view.
    }


}

extension ClusterDetailViewController: Injectable {
    
    func inject(_ viewModel: ClusterVM) {
        self.viewModel = viewModel
    }
    
    func assertDependencies() {
        assert(viewModel != nil)
    }
}
