//
//  HabitApp.swift
//  Habit
//
//  Created by Vitor Otero on 22/03/2022.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
