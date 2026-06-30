//
//  Pantry.swift
//  PerisHabits
//
//  Created by Scholar on 6/24/26.
//

import SwiftUI

struct Pantry: View {
    
    @State private var foods: [FoodItemInfo] = [
        FoodItemInfo(name:"Milk", expirationDate: .now, quantity: 2, location: "Refrigerator")
    ]
    @State private var newFoodItem = ""
    @State private var newExpirationDate = Date.now
    @State private var newQuantity: Int = 1
    @State private var newLocation = ""
    var body: some View {
        Text("Pantry")
            .font(.title)
            .padding(10)
        HStack{
            Button("Add"){
                
            }
            Button("Undo"){
                
            }
            Menu("Sort By"){
                Button("Category"){
                    
                }
                Button("Date"){
                    
                    
                }
            }
        }
        NavigationStack{
                List(foods, id: \.name){ food in
                    VStack{
                        Text(food.name)
                    }
                }
            .navigationTitle("Pantry")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("Expiration Date")
                        .font(.headline)
                    DatePicker(selection: $newExpirationDate){
                        TextField("Name", text: $newFoodItem)
                            .textFieldStyle(.roundedBorder)
                        TextField("Location", text: $newLocation)
                            .textFieldStyle(.roundedBorder)
                    Picker("Quantity", selection: $newQuantity){
                            ForEach(1...100, id: \.self){ quant in
                                Text("\(quant)")
                            }
                    }
                    .pickerStyle(.wheel)
                    .frame(height:150)
                        
                    }
                    Button("Save"){
                        let newFood = FoodItemInfo(name: newFoodItem, expirationDate: newExpirationDate, quantity: newQuantity, location: newLocation)
                        foods.append(newFood)
                        newFoodItem = ""
                        newExpirationDate = .now
                        newQuantity = 1
                        newLocation = ""
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
        
        
    }
}
                

    #Preview {
        Pantry()
    }

