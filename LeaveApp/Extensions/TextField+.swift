//
//  TextField+.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import SwiftUI

extension TextField where Label == Text {
    /// Initialize a TextField using an L10n key as the placeholder.
    init(_ placeholderKey: L10n, text: Binding<String>) {
        self.init(LocalizedStringKey(placeholderKey), text: text)
    }
}
