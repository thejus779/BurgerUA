//
//  APIManager.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//


import Foundation
import NVActivityIndicatorView
import ObjectMapper
import Alamofire
import SwiftyJSON

typealias Completion = (Response) -> ()
class APIManager: UIViewController {

  static let shared = APIManager()
  private lazy var httpClient: HTTPClient = HTTPClient()

  func request(with api: Router , completion: @escaping Completion,isLoaderNeeded : Bool)  {

    if isLoaderNeeded{
        startAnimateLoader()
    }
    
    
      httpClient.postRequest(withApi: api,success: { (data) in

        self.stopAnimating()

        guard let response = data else {
          completion(Response.failure(.none))
          return
        }
        let json = JSON(response)
        print(json)

        completion(Response.success(json))
        return

        }, failure: {(message) in
          completion(Response.failure(.none))
            self.stopAnimating()
            completion(Response.failure(message))
      })
  }
    func startAnimateLoader() {
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.startAnimating(CGSize(width: 60,height: 40), message: "", type: .ballSpinFadeLoader, color: UIColor.black, padding: 0, displayTimeThreshold: 20, minimumDisplayTime: 1)
        
    }
    
    func stopAnimating(){
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.stopAnimating()
    }
  
}
extension UIViewController : NVActivityIndicatorViewable { }
