//
//  Restaurent.swift
//  HotelListing
//
//  Created by Aadesh Maheshwari on 09/12/15.
//  Copyright © 2015 Aadesh Maheshwari. All rights reserved.
//

import UIKit

class Restaurent: NSObject {
    
    var name: String?
    var imageURl: String?
    var price: String?
    
    init(restaurentName: String, restaurentPrice: String, restaurentImageURL: String ) {
        super.init()
        self.name = restaurentName
        self.price = restaurentPrice
        self.imageURl = restaurentImageURL
    }

}
