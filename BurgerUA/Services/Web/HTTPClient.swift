//
//  HTTPClient.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SCLAlertView

typealias HttpClientSuccess = (Any?) -> ()
typealias HttpClientFailure = (String) -> ()

class HTTPClient {
  
  func postRequest(withApi api: Router, success: @escaping HttpClientSuccess, failure: @escaping HttpClientFailure) {

    let fullPath = api.baseURL + api.route

    Alamofire.request(fullPath).responseJSON { (response) in
        
        guard let data = response.data else {
            return
        }
        
        let json = JSON(data)
        print(json)
        if let status = response.response?.statusCode {
            
            switch(status) {
                
            case 200..<300:
                
                switch response.result {
                case .success(let data):
                    success(data)
                case .failure(let error):
                    failure(error.localizedDescription)
                }
                
                
            case 401:
               self.showAlert(error: Constants.msgUnauthorized)
                failure(Constants.msgUnauthorized)
                break
                
            case 408:
               self.showAlert(error: Constants.msgServerNotFound)
                failure(Constants.msgServerNotFound)
                break
                
            case 500:
                self.showAlert(error: Constants.internatServeError)
                failure(Constants.internatServeError)
                break
                
            default:
                self.showAlert(error: Constants.msgErrorWithStatus +  "\(status)")
                print(Constants.msgErrorWithStatus +  "\(status)")
            }
        }
    }
    }
    func showAlert(error:String){
        SCLAlertView().showError(Constants.errorMessage, subTitle: error)
    }
}

