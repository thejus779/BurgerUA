//
//  Burgers.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

typealias OptionalSwiftJSONParameters = [String : JSON]?


class Burgers: Mappable {
    var title : String?
    var desc : String?
    var id : String?
    var price : Int?
    var thumbnail : String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id          <- map["ref"]
        title       <- map["title"]
        desc        <- map["description"]
        thumbnail   <- map["thumbnail"]
        price       <- map["price"]
        
    }
}
