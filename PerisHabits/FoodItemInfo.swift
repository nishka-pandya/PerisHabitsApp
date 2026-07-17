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
    var useByDate: Date
    var quantity: Int
    var type: String
    
    init(name: String, useByDate: Date, quantity: Int, type: String, ){
        self.name = name
        self.useByDate = useByDate
        self.quantity = quantity
        self.type = type
        //if (self.type.values == "Highest"){
            
        //}
    }
    
    
    
    
    
    
}
