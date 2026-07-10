//
//  PerisHabitsApp.swift
//  PerisHabits
//
//  Created by Scholar on 6/22/26.
//

import SwiftUI
import SwiftData

@main
struct PerisHabitsApp: App {
    var body: some Scene {
        WindowGroup {
            Pantry()
        }
        .modelContainer(for: FoodItemInfo.self)
    }
}
