//
//  Clusterable.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Result

protocol Clusterable {
    func clusterList()  -> Observable<Cluster>
}
