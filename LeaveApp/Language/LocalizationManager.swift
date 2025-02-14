//
//  LocalizationManager.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//


import SwiftUI
import Combine

class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()
    
    /// The currently selected language code, e.g. "en", "ko", "fr"
    @Published var currentLanguage: String = "en" {
        didSet {
            // 1) (Optional) Save user preference
            UserDefaults.standard.setValue(currentLanguage, forKey: "SelectedLanguage")
            
            // 2) (Advanced) Switch your Bundle here if you’re doing method swizzling:
            // Bundle.setLanguage(currentLanguage)
            
            // 3) Update a published locale to force SwiftUI re-render:
            locale = Locale(identifier: currentLanguage)
        }
    }
    
    /// Tells SwiftUI which locale to use for standard `Text` calls
    @Published var locale: Locale = .current
    
    private init() { 
        loadSavedLanguage()
    }
    
    func loadSavedLanguage() {
        if let saved = UserDefaults.standard.string(forKey: "SelectedLanguage") {
            currentLanguage = saved
        }
    }
}
