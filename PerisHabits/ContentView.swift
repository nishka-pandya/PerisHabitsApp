//
//  ContentView.swift
//  PerisHabits
//
//  Created by Scholar on 6/22/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var foodDashboard: [FoodItemInfo]
    
    func findTop(originalFoodArray: [FoodItemInfo]) -> [FoodItemInfo]{
        var topFoodItems = [FoodItemInfo]()
        //for foodItems in originalFoodArray{
            //topFoodItems.append(foodItems)
        //}
        var sortedByDate = originalFoodArray.sorted(by: {$0.expirationDate < $1.expirationDate})
        
        var index = 0;
        while (topFoodItems.count < 3 && index < sortedByDate.count){
                topFoodItems.append(sortedByDate[index])
                //sortedByDate.remove(at: index)
                index+=1
                
                
        }
        
        return topFoodItems
        
    }
    var body: some View {
        //VStack {
        //Text("Today's Dashboard")
        //.font(.title)
        //Text("Use Spinach today before using newer vegetables!")
        // .padding(20)
        //.frame(minWidth:120, maxWidth: .infinity, alignment:.center)
        //.background(.green)
        //.cornerRadius(20)
        //Button("Mark as Done"){
        
        //}
        
        //Text("Remember to store newly bought food in refrigerator if not consumed within 24 hours")
        // .padding(20)
        // .frame(minWidth:120, maxWidth: .infinity, alignment: .center)
        // .background(.green)
        // .cornerRadius(20)
        //Button("Mark as Done"){
        
        //}
        //Text("Remember to check your fridge before shopping! Usual bought items are: [...] and right now you have [...]")
        //    .padding(20)
        //    .frame(minWidth:120,maxWidth:.infinity, alignment: .center)
        //    .background(.green)
        //    .cornerRadius(20)
        // Button("Mark as Done"){
        
        
        //  }
        NavigationStack{
            VStack{
                Text("Dashboard")
                    .font(.title)
                Text("Use Soon")
                
                
                
                ForEach(findTop(originalFoodArray: foodDashboard)){ food in
                    Text(food.name)
                        .font(.title2)
                        .padding(20)
                        .frame(minWidth:120, maxWidth: .infinity, alignment: .center)
                        .background(.green)
                        .cornerRadius(20)
                    Button("Done"){
                        
                    }
                    .font(.title3)
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                }
            }
            
            .toolbar{
                ToolbarItemGroup(placement: .status){
                    NavigationLink(destination: Pantry()){
                        Text("Refrigerator")
                    }
                }
            }
            Spacer()
        }
        
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        //.navigationBarHidden(true)
        
    }
    
}


#Preview {
    ContentView()
        .modelContainer(for: FoodItemInfo.self, inMemory: true)
}
