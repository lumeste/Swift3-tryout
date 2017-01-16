//
//  TrashPointModel.swift
//  wcd2k18
//
//  Created by Mart Lumeste on 12/12/2016.
//  Copyright © 2016 Mart Lumeste. All rights reserved.
//

import Foundation
import UIKit

public struct TrashPointModel {
    
    var name : String?
    var trashAmount : String?
    var trashType : String?
    var formattedAddress: String?
    var postalCode : Int?
    var locationLatitude: Float?
    var locationLongitude : Float?
    
    
    
    init(name: String, trashType: String, trashAmount: String, formattedAddress: String, postalCode: Int, locationLatitude: Float, locationLongitude: Float) {
        
        self.name = name
        self.trashType = trashType
        self.trashAmount = trashAmount
        self.formattedAddress = formattedAddress
        self.postalCode = postalCode
        self.locationLatitude = locationLatitude
        self.locationLongitude = locationLongitude
        
    }
    
}
