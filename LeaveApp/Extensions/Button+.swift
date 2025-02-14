//
//  Button+.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import SwiftUI

extension Button where Label == Text {
    /// Initialize a Button using an L10n key as the title.
    init(_ titleKey: L10n, action: @escaping () -> Void) {
        self.init(action: action, label: { Text(titleKey) })
    }
}
