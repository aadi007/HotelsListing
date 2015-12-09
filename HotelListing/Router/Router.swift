//
//  Router.swift
//  HotelListing
//
//  Created by Aadesh Maheshwari on 09/12/15.
//  Copyright © 2015 Aadesh Maheshwari. All rights reserved.
//

import Alamofire
import SwiftyJSON

/**
 *  Base router which has list of all the router that will be used to make network call
 *  throughout the app.
 */
enum Router: URLRequestConvertible {
    
    case UtilRouteManager(UtilRouter)
    var URLRequest: NSMutableURLRequest {
        
        switch self {
            
        case .UtilRouteManager(let request):
            let Url = NSURL(string: request.path)!
            
            let mutableURLRequest = NSMutableURLRequest(URL: Url)
            mutableURLRequest.HTTPMethod = request.method.rawValue
            
            print(mutableURLRequest.URL)
            // Check if request has parameters defined
            if let parameters: AnyObject = request.parameters {
                return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters as? [String : AnyObject]).0
            } else {
                return mutableURLRequest
            }
        }
    }
}



// MARK: - Alamofire request extension
//  - Add debugLog method which logs request
extension Request {
    public func debugLog() -> Self {
        
        print("===============")
        print(self)
        print("Headers ---> ")
        print(self.request!.allHTTPHeaderFields)
        print("Body ---> ")
        if let requestBody = self.request!.HTTPBody {
            print(NSString(data: requestBody, encoding: NSUTF8StringEncoding))
        }
        print("===============")
        
        return self
    }
}