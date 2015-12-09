//
//  Util.swift
//  HotelListing
//
//  Created by Aadesh Maheshwari on 09/12/15.
//  Copyright © 2015 Aadesh Maheshwari. All rights reserved.
//

import Foundation
import Alamofire

/**
 *  Util resource is used for all generic API.
 *  Every resource is added as a case and its path and method is added to
 *  respective strings.
 */
enum UtilRouter {
    
    case GetHotelsData()
    
    var path: String {
        switch self {
            
        case .GetHotelsData:
            return "https://api.myjson.com/bins/4ckcr"
        }
    }
    
    var method: Alamofire.Method {
        switch self {
        case .GetHotelsData():
            return .GET
        }
    }
    
    var parameters: AnyObject? {
        switch self {
        default:
            return nil
        }
    }
}