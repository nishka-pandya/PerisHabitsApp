//
//  EditFoodView.swift
//  PerisHabits
//
//  Created by Scholar on 7/10/26.
//

import SwiftUI

struct EditFoodView: View {
    var food: FoodItemInfo
    @State private var newFoodName: String
    @State private var newExpirationDate: Date
    @State private var newType: String
    @State private var newQuantity: Int
    @Environment(\.dismiss) private var dismiss
    
    init(food: FoodItemInfo){
        self.food = food
        _newFoodName = State(initialValue: food.name)
        _newExpirationDate = State(initialValue: food.expirationDate)
        _newType = State(initialValue: food.type)
        _newQuantity = State(initialValue: food.quantity)
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $newFoodName)
            TextField("Location", text: $newType)
            DatePicker("Day Bought", selection: $newExpirationDate, in: Date.distantPast...Date.now, displayedComponents: .date)
            Picker("Quantity", selection: $newQuantity){
                ForEach(1...100, id: \.self){ quant in
                    Text("\(quant)")
                }
            }
            
        }
        .navigationTitle("Edit Food")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
            
                }
            }
            ToolbarItem(placement: .confirmationAction){
                Button("Save"){
                    food.name = newFoodName
                    food.type = newType
                    food.expirationDate = newExpirationDate
                    food.quantity = newQuantity
                    dismiss()
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        EditFoodView(food: FoodItemInfo(name: "Test", expirationDate: Date.now, quantity: 1, type: "Test"))
    }
}
