//
//  ClusterService.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import RxSwift
import Moya

struct ClusterService: ClusterServiceType {
    
    private var unsplash: MoyaProvider<LoadAPI>
    
    
    init(unsplash: MoyaProvider<LoadAPI> = MoyaProvider<LoadAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])) {
        self.unsplash = unsplash
    }
    
}

extension ClusterService: Clusterable {
    
    func clusterList()-> Observable<Cluster> {
        return unsplash.rx
            .request(.clusterList())
            .map(Cluster.self)
            .asObservable()
    }
}
