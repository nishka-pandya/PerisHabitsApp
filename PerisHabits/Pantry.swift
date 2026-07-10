//
//  Pantry.swift
//  PerisHabits
//
//  Created by Scholar on 6/24/26.
//

import SwiftUI
import SwiftData

struct Pantry: View {
    
    @Query private var foods: [FoodItemInfo]
    @Environment(\.modelContext) private var context
    @State private var newFoodItem = ""
    @State private var newExpirationDate = Date.now
    @State private var newQuantity: Int = 1
    @State private var newLocation = ""
    var body: some View {
        Text("Pantry")
            .font(.title)
            .padding(10)
        HStack{
            Button("Undo"){
                
            }
            Menu("Sort By"){
                Button("Category"){
                    
                }
                Button("Use Soon"){
                    
                    
                }
            }
        }
        NavigationStack{
                List{
                    ForEach(foods) { food in
                        VStack{
                            Text(food.name)
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("New Item")
                        .font(.headline)
                        VStack{
                            TextField("Name", text: $newFoodItem)
                            .textFieldStyle(.roundedBorder)
                            TextField("Type", text: $newLocation)
                            .textFieldStyle(.roundedBorder)
                            Text("Date Bought")
                            DatePicker(selection: $newExpirationDate, in: Date.distantPast...Date.now, displayedComponents: .date){}
                                .frame(maxWidth: .infinity, alignment:.center)
                            Text("Quantity")
                            Picker("Quantity", selection: $newQuantity){
                                ForEach(1...100, id: \.self){ quant in
                                    Text("\(quant)")
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height:70)
                        }
                
                        
                    
                    Button("Save"){
                        let newFood = FoodItemInfo(name: newFoodItem, expirationDate: newExpirationDate, quantity: newQuantity, location: newLocation)
                        context.insert(newFood)
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
    
    func deleteItem(at offsets: IndexSet){
        for index in offsets {
            let itemToDelete = foods[index]
            context.delete(itemToDelete)
        }
    }
}
                

    #Preview {
        Pantry()
            .modelContainer(for: FoodItemInfo.self, inMemory: true)
    }

