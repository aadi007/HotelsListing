//
//  Restaurent.swift
//  HotelListing
//
//  Created by Aadesh Maheshwari on 09/12/15.
//  Copyright © 2015 Aadesh Maheshwari. All rights reserved.
//

import UIKit
import SwiftyJSON

class Restaurent: NSObject {
    
    var name: String?
    var imageURl: String?
    var price: String?
    
    init(json:JSON) {
        super.init()
        if let URL = json["imageId"].string {
            self.imageURl = URL
        }
        if let name = json["name"].string {
            self.name = name
        }
        
        if json["costForTwo"] != nil {
            self.price = String(json["costForTwo"].intValue)
        }
    }
}
