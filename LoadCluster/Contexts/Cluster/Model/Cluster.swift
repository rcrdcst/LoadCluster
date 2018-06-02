//
//  Cluster.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation

struct Cluster: Codable {
    let appName, package: String
    let establishments: [Establishment]
}

struct Establishment: Codable {
    let name, phone: String
    let location: Location
    let description: String
}

struct Location: Codable {
    let name: String
    let lat, long: Double
}
