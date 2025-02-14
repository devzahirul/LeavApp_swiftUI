//
//  LeaveAppApp.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//

import SwiftUI

@main
struct LeaveAppApp: App {
    @StateObject private var localizationManager = LocalizationManager.shared
       
    init() {
        // Load any previously saved language
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localizationManager)
                // Key point: pass the locale to SwiftUI environment
                .environment(\.locale, localizationManager.locale)

        }
    }
}
