//
//  APIHandler.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation
import ObjectMapper


//<-----------------------------BURGER CUSTOM END POINT------------------------------->

extension BurgerEndPoint {
    
    func handle(data : Any) -> AnyObject? {
        
        switch self {
            
        case .getAllData():
            let object  = Mapper<Burgers>().map(JSONObject: data)
            return object
            
        default:
            return data as AnyObject
        }
    }
    
}




