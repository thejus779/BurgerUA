//
//  APIRoutes.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

protocol Router {
  
  var route: String { get }
  var baseURL: String { get }
  var method: Alamofire.HTTPMethod { get }
  
  func handle(data: Any) -> AnyObject?
}

