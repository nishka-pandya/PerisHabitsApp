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
    private var foodTypes: Dictionary = ["Leftovers": "Highest", "Dairy":"Medium-High", "Fresh Produce": "Medium", "Meats": "High", "Seafood": "High", "Condiments": "Lower", "Fruit": "Lower"]
    
    func findTop(originalFoodArray: [FoodItemInfo]) -> [FoodItemInfo]{
        var topFoodItems = [FoodItemInfo]()
        
        let sortedByDate = originalFoodArray.sorted(by: {$0.useByDate < $1.useByDate})
        
        var index = 0;
        while (topFoodItems.count < 3 && index < sortedByDate.count){
            topFoodItems.append(sortedByDate[index])
            //sortedByDate.remove(at: index)
            index+=1
            
            
        }
        
        return topFoodItems
        
    }
    var body: some View {
        /*ZStack{
         Color.green.opacity(0.2)
         .ignoresSafeArea()
         VStack {
         Text("Today's Dashboard")
         .font(.title)
         .fontWeight(.bold)
         .fontDesign(.serif)
         .padding(20)
         .frame(minWidth:120, maxWidth:.infinity, alignment:.center)
         .foregroundStyle(.green)
         .brightness(-0.4)
         .background(.green.opacity(0.7))
         //.background(Color.green.brightness(-0.3))
         
         Text("Use Soon")
         .font(.title)
         .fontWeight(.bold)
         .fontDesign(.serif)
         .padding(10)
         .foregroundStyle(.green)
         .brightness(-0.4)
         
         VStack(alignment:.leading, spacing: 20.0){
         HStack(spacing: 100.0){
         Text("Milk")
         .fontDesign(.serif)
         .frame(minWidth:120, maxWidth: .infinity, alignment:.leading)
         .font(.title3)
         Text("In 3 days")
         }
         .fontDesign(.serif)
         .font(.title3)
         Button("Mark as Used"){
         
         }
         .buttonStyle(.borderedProminent)
         .fontDesign(.serif)
         .foregroundColor(.white)
         .padding(5)
         
         }
         .padding()
         .background(Rectangle()
         .foregroundColor(.white))
         .cornerRadius(20)
         .shadow(radius:15)
         .padding()
         
         VStack (alignment: .leading, spacing: 20.0){
         HStack(spacing: 100.0){
         Text("Chicken Leftovers")
         .fontDesign(.serif)
         .frame(minWidth:120, maxWidth: .infinity, alignment: .leading)
         .font(.title3)
         Text("In 5 days")
         }
         .font(.title3)
         .fontDesign(.serif)
         Button("Mark as Used"){
         
         }
         .fontDesign(.serif)
         .buttonStyle(.borderedProminent)
         .padding(5)
         
         }
         .padding()
         .background(Rectangle() .foregroundColor(.white))
         .cornerRadius(20)
         .shadow(radius:15)
         .padding()
         
         
         VStack(alignment: .leading, spacing: 20.0){
         HStack(spacing: 100.0){
         Text("Rice Leftovers")
         .fontDesign(.serif)
         .frame(minWidth:120,maxWidth:.infinity, alignment: .leading)
         .font(.title3)
         Text("In 8 days")
         }
         .font(.title3)
         .fontDesign(.serif)
         Button("Mark as Done"){
         
         
         }
         .fontDesign(.serif)
         .buttonStyle(.borderedProminent)
         .padding(5)
         }
         .padding()
         .background(Rectangle() .foregroundColor(.white))
         .cornerRadius(20)
         .shadow(radius:15)
         .padding()
         Spacer()*/
        
        NavigationStack{
            ZStack{
                Color.green.opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    Text("Today's Dashboard")
                    /*.fontWeight(.bold)
                     .fontDesign(.serif)
                     .font(.title)
                     .background(.purple.opacity(0.6))
                     .cornerRadius(20)
                     .padding(10)*/
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .padding(20)
                        .frame(minWidth:120, maxWidth:.infinity, alignment:.center)
                        .foregroundStyle(.green)
                        .brightness(-0.4)
                        .background(.green.opacity(0.7))
                    
                    Text("Use Soon")
                    //.font(.title2)
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .padding(10)
                        .foregroundStyle(.green)
                                                .brightness(-0.4)
                    
                    if(findTop(originalFoodArray: foodDashboard).count <= 0){
                        //Text("hi")
                        VStack(alignment:.leading, spacing: 20.0){
                            Text("Add New Groceries in Refrigerator!")
                                .fontDesign(.serif)
                                .frame(minWidth:120, maxWidth: .infinity, alignment:.center)
                                .font(.title3)
                        }
                        .padding()
                        .background(Rectangle().foregroundColor(.white))
                        .cornerRadius(20)
                        .shadow(radius: 15)
                        .padding()
                    }
                    else{
                        ForEach(findTop(originalFoodArray: foodDashboard)){ food in
                            VStack(alignment:.leading, spacing: 20.0){
                                HStack(spacing: 100.0){
                                    Text(food.name)
                                        .fontDesign(.serif)
                                        .frame(minWidth:120, maxWidth: .infinity, alignment:.leading)
                                        .font(.title3)
                                    Text("In 3 days")
                                }
                                .fontDesign(.serif)
                                .font(.title3)
                                Button("Mark as Used"){
                                    
                                }
                                .buttonStyle(.borderedProminent)
                                .fontDesign(.serif)
                                .foregroundColor(.white)
                                .padding(5)
                                
                            }
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(.white))
                            .cornerRadius(20)
                            .shadow(radius:15)
                            .padding()
                            
                            /*Text(food.name)
                             .font(.title2)
                             .padding(20)
                             .frame(minWidth:0, maxWidth: 400, alignment: .center)
                             .background(.white)
                             .cornerRadius(20)
                             Button("Done"){
                             
                             }
                             .font(.title3)
                             .buttonStyle(.borderedProminent)
                             .tint(.purple)
                             }*/
                        }
                }
                    Spacer()
                }
            }
            
            
            
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    NavigationLink(destination: Pantry()){
                        Text("Refrigerator")
                            .padding()
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundStyle(.green)
                            .brightness(-0.4)
                            .background(.green.opacity(0.7))
                            .cornerRadius(30)
                    }
                }
            }
            .toolbarBackground(Color.green, for:.bottomBar)
            .toolbarBackground(.visible, for: .bottomBar)
            
            Spacer()
        }
        .toolbarBackground(Color.green, for:.bottomBar)
        .toolbarBackground(.visible, for: .bottomBar)
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        //.navigationBarHidden(true)
        
    }
            
}
    

    
    
    #Preview {
        ContentView()
            .modelContainer(for: FoodItemInfo.self, inMemory: true)
    }

