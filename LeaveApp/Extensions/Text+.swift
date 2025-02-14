//
//  Text+.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import SwiftUI

extension Text {
    init(_ l10n: L10n) {
        // We pass a LocalizedStringKey constructed from the enum
        self.init(LocalizedStringKey(l10n))
    }
}

