//
//  ClusterVM.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

private let defaultvalue: String = "--"

final class ClusterVM {
    
    private let handler: Clusterable
    private let disposeBag = DisposeBag()
    private var establishments: [Establishment]?
    var selectedMarkerLong: Double?
    var selectedMarkerLat: Double?
   
    
    init(handler: Clusterable) {
        self.handler = handler
    }
    
    func clusterList() -> Observable<[Establishment]> {
        
         return handler.clusterList().map { [unowned self] response  -> [Establishment] in
            self.establishments = response.establishments
            return response.establishments
        }
    
    }
    
    func getEstablishmentData() -> Establishment? {
    
        guard let allEstablishments = establishments else {
            return nil
        }
        if let establishment = allEstablishments.first(where: {$0.location.lat == selectedMarkerLat && $0.location.long == selectedMarkerLong}) {
            return establishment
        } else {
            return nil
        }
    }
    
  
}
