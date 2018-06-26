//
//  Conversions.swift
//  BurgerUA
//
//  Created by thejus manoharan on 18/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation

class Conversions:NSObject {
    
    //TO Convert int to a formatted price 889 = 8,99
    func formattedPrice(price : Int) -> String {
        
        var tmpStr:String! = String(describing: price)
        if (tmpStr.count>2) {
            tmpStr.insert(".", at: tmpStr.index(tmpStr.endIndex, offsetBy: -2))
        }
        else{
            tmpStr.insert(".", at: tmpStr.index(tmpStr.endIndex, offsetBy: -2))
            tmpStr.insert("0", at: tmpStr.index(tmpStr.endIndex, offsetBy: -3))
        }
        return tmpStr + "€"
    }
}

