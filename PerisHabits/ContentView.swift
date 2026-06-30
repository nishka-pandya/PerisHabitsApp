//
//  ContentView.swift
//  PerisHabits
//
//  Created by Scholar on 6/22/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Today's Dashboard")
                .font(.title)
            Text("Use Spinach today before using newer vegetables!")
                .padding(20)
                .frame(minWidth:120, maxWidth: .infinity, alignment:.center)
                .background(.green)
                .cornerRadius(20)
            Button("Mark as Done"){
                
            }
                
            Text("Remember to store newly bought food in refrigerator if not consumed within 24 hours")
                .padding(20)
                .frame(minWidth:120, maxWidth: .infinity, alignment: .center)
                .background(.green)
                .cornerRadius(20)
            Button("Mark as Done"){
                
            }
            Text("Remember to check your fridge before shopping! Usual bought items are: [...] and right now you have [...]")
                .padding(20)
                .frame(minWidth:120,maxWidth:.infinity, alignment: .center)
                .background(.green)
                .cornerRadius(20)
            Button("Mark as Done"){
                
            }
            
            Text("Navigation")
                .font(.title)
            Spacer()
                
        }
        
    }
}

#Preview {
    ContentView()
}
