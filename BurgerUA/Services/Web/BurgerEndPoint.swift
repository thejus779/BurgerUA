//
//  HomeEndPoint.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation

import UIKit
import Alamofire
import ObjectMapper

enum BurgerEndPoint {
    
    case getAllData()
}

extension BurgerEndPoint: Router {
    
   
    var route: String  {
        
        switch self {
            
        case.getAllData(): return APITypes.getAllData
            
            
        }
    }
    
    var method: Alamofire.HTTPMethod {
        
        switch self {
            
        default:
            return .get
        }
    }
    
    var baseURL: String{
        return APIBasePath.basePath
    }
}
