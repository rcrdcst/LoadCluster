//
//  ClusterAPIEndPoint.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import Moya

enum LoadAPI {
    case clusterList()
}

extension LoadAPI: TargetType  {
    
    var baseURL: URL {
        
        guard let url = URL(string: "http://www.mocky.io/v2/56e327122600009f1076f528") else {
            fatalError("FAILED: http://www.mocky.io/v2/56e327122600009f1076f528")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .clusterList:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .clusterList:
            return .get
        }
        
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
//        switch self {
//        case .clusterList:
//            return  ["JsonStub-User-Key" : Constants.JsonStubUserKey, "JsonStub-Project-Key" : Constants.JsonStubProjectKey]
//        default:
//            return nil
//        }
        
        return nil
    }
    
}
