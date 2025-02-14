//
//  LocalizedStringKey+.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import SwiftUI

extension LocalizedStringKey {
    /// Allows `LocalizedStringKey(.personalInformation)` instead of raw strings.
    init(_ l10n: L10n) {
        self.init(l10n.rawValue)
    }
}
