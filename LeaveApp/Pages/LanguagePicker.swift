//
//  LanguagePicker.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import SwiftUI

struct LanguagePickerSection: View {
    @EnvironmentObject var localizationManager: LocalizationManager
    
    let supportedLanguages = ["en", "ko", "fr"]
    
    var body: some View {
        Picker(selection: $localizationManager.currentLanguage, label: Label("Language", systemImage: "network")) {
            ForEach(supportedLanguages, id: \.self) { lang in
                Text(displayName(for: lang)).tag(lang)
            }
        }
        .pickerStyle(.menu)
    }
    
    private func displayName(for code: String) -> String {
        switch code {
        case "en": return "English"
        case "ko": return "한국어"
        case "fr": return "Français"
        default:   return code
        }
    }
}
