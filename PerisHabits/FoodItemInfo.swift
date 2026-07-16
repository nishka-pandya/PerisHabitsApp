//
//  FoodItemInfo.swift
//  PerisHabits
//
//  Created by Scholar on 6/28/26.
//

import Foundation
import SwiftData

@Model
class FoodItemInfo{
    
    var name: String
    var expirationDate: Date
    var quantity: Int
    var type: String
    //var typePriority: Int
    
    init(name: String, expirationDate: Date, quantity: Int, type: String, ){
        self.name = name
        self.expirationDate = expirationDate
        self.quantity = quantity
        self.type = type
        //if (self.type.values == "Highest"){
            
        //}
    }
    
    
    
    
    
    
}
