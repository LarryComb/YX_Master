//
//  DataTableItemView.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 1/12/21.
//

import Foundation

import SwiftUI

struct DataTableItemView: View {
    var message: Message
    
    var body: some View {
        HStack(spacing: 5)
        {
            Text(message.message).frame(maxWidth: .infinity, alignment: .leading).lineLimit(1).font(.system(size: 17))
        }
        .listRowBackground(Color.backgroundColorList)
        .foregroundColor(Color.textColorSecondary)
        .frame(maxWidth: .infinity)
    }
}

