//
//  POIItem.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation

class POIItem: NSObject, GMUClusterItem {
    
    var position: CLLocationCoordinate2D
    var name: String!
    var markerDescription: String!
    
    init(position: CLLocationCoordinate2D, name: String, description: String) {
        self.position = position
        self.name = name
        self.markerDescription = description
        
    }
}
