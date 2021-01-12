//
//  SecondViewController.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 12/26/20.
//

import Foundation
import SwiftUI
import FirebaseDatabase
import ActivityIndicatorView

struct SecondViewController: View {
    @ObservedObject var dataTableStore = DataTableStore()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "colorPrimary")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "colorPrimary")
        UITableView.appearance().backgroundColor = UIColor(named: "backgroundColorList")
        UITextView.appearance().backgroundColor = .clear
        UIScrollView.appearance().bounces = true
    }
    
    func fetchDataTableData () {
        dataTableStore.listenDataTables()
    }
    
    var btnBack : some View
    { Button(action: {
        self.mode.wrappedValue.dismiss()
    })
    {
        HStack {
            Image(systemName: "chevron.left") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.textColorPrimary)
            Text("FashionBot").foregroundColor(Color.textColorPrimary)
        }
    }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColorList.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading) {
                    Text("DataTable rows")
                    Spacer()
                    List {
                        ForEach(dataTableStore.messages, id: \.self) { message in
                            DataTableItemView(message: message)
                        }
                        .listRowBackground(Color.backgroundColorList)
                        .foregroundColor(Color.textColorSecondary)
                    }
                    .onAppear { UITableViewCell.appearance().selectionStyle = .none }
                    .listStyle(PlainListStyle())
                }
                .background(Color.backgroundColorList)
                .navigationBarTitle("Notifications", displayMode: .inline)
                //.navigationBarHidden(true)
                .foregroundColor(Color.textColorPrimary)
                .background(Color.backgroundColorList)
                .onAppear(perform: fetchDataTableData)
                .navigationViewStyle(StackNavigationViewStyle())
                .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                    if(value.startLocation.x < 20 && value.translation.width > 100) {
                        self.mode.wrappedValue.dismiss()
                    }
                }))
                
                ActivityIndicatorView(isVisible: $dataTableStore.loading, type: .scalingDots)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.accent)
                    .padding(10)
            }
        }
    }
}










