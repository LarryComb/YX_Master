//
//  Extensions.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 1/12/21.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if !hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
