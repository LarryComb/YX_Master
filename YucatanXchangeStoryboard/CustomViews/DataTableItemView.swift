//
//  DataTableItemView.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 1/12/21.
//

import Foundation

import SwiftUI

struct DataTableItemView: View {
    var notificationData: NotificationData
    
    var body: some View {
        HStack(spacing: 5)
        {
            Text(notificationData.Test_2).frame(maxWidth: .infinity, alignment: .leading).lineLimit(1).font(.system(size: 17))
        }
        .listRowBackground(Color.backgroundColorList)
        .foregroundColor(Color.textColorSecondary)
        .frame(maxWidth: .infinity)
    }
}

