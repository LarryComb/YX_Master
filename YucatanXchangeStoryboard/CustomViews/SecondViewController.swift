//
//  SecondViewController.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 12/26/20.
//

import Foundation
import SwiftUI
import FirebaseDatabase



struct ContentView: View {
    @ObservedObject var dataTableStore = DataTableStore()
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "colorPrimary")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "colorPrimary")
        UITableView.appearance().backgroundColor = UIColor(named: "backgroundColorList")
    }
    
    func fetchDataTableData () {
        dataTableStore.listenDataTables()
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
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(
                    leading:
                        Text("DataTable"))
                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color.textColorPrimary)
                
                ActivityIndicatorView(isVisible: $dataTableStore.loading, type: .scalingDots)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.accent)
                    .padding(10)
            }
        }
        .background(Color.backgroundColorList)
        .onAppear(perform: fetchDataTableData)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}













/*

 class SecondViewController: UIViewController {
    
   
    var databaseRef: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = Database.database().reference()
        databaseRef?.observe(.childAdded) { (snapshot) in
            print("\(snapshot.key):\(snapshot.value!)")
        }
    }
    
}

*/
/*

 class SecondViewController: UIViewController {

    override func viewDidLoad(){
      super.viewDidLoad()
        view.backgroundColor = .systemBlue
      title = "Notifications"
    }
}

*/


/*
struct SecondViewController: View {
    @Binding var showSelf: Bool

    var body: some View {
        

        VStack {
            
            Button(action: {
                self.showSelf = false
            }) {
                Text("go back")
            }
            
            List {
                Text("row 1")
                Text("row 2")
                Text("row 4")
                Text("row 5")
                Text("row 6")
                Text("row 7")
                Text("row 8")
            }
        }
   
        
    }
}

*/
