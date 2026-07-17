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
    @State private var newUseByDate = Date.now
    @State private var newQuantity: Int = 1
    @State private var newType = ""
    @State private var selectedFood: FoodItemInfo?
    
    private var foodTypes: Dictionary = ["Leftovers": "Highest", "Dairy":"Medium-High", "Fresh Produce": "Medium", "Meats": "High", "Seafood": "High", "Condiments": "Lower", "Fruit": "Lower"]
    
    var body: some View {
        //Text("Pantry")
            //.font(.title)
            //.padding(10)
        //HStack{
            //Button("Undo"){
                
            //}
            //Menu("Sort By"){
                //Button("Category"){
                    
                //}
                //Button("Use Soon"){
                    
                    
                //}
            //}
        NavigationStack{
            HStack{
                Menu("Sort By"){
                    Button("Category"){
                        
                    }
                    Button("Use Soon"){
                        
                    }
                }
            }
                List{
                    ForEach(foods) { food in
                        HStack{
                            Text(food.name)
                            Spacer()
                            Text(food.useByDate, format:.dateTime.month(.wide).day().year())
                        }
                        .onTapGesture {
                            selectedFood = food
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Pantry")
                .navigationBarTitleDisplayMode(.inline)
                .sheet(item: $selectedFood){ food in
                    NavigationStack {
                        EditFoodView(food: food)
                    }
                    
                }
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("New Item")
                        .font(.headline)
                        VStack{
                            TextField("Name", text: $newFoodItem)
                            .textFieldStyle(.roundedBorder)
                            //TextField("Type of Food", text: $newLocation)
                            //.textFieldStyle(.roundedBorder)
                            HStack{
                                Text("Food Type")
                                Picker("Type of Food", selection: $newType){
                                    ForEach(foodTypes.keys.sorted(), id: \.self){ type in
                                        Text("\(type)")
                                        
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(height: 70)
                            }
                            HStack{
                                Text("Use By Date")
                                DatePicker(selection: $newUseByDate, in: Date.distantPast...Date.distantFuture, displayedComponents: .date){}
                                    .frame(maxWidth: .infinity, alignment:.center)
                            }
                            HStack{
                                Text("Quantity")
                                Picker("Quantity", selection: $newQuantity){
                                    ForEach(1...100, id: \.self){ quant in
                                        Text("\(quant)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(height:70)
                            }
                        }
                
                        
                    
                    Button("Save"){
                        let newFood = FoodItemInfo(name: newFoodItem, useByDate: newUseByDate, quantity: newQuantity, type: newType)
                        context.insert(newFood)
                        newFoodItem = ""
                        newUseByDate = .now
                        newQuantity = 1
                        newType = ""
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

