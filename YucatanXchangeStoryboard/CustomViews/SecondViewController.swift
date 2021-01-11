//
//  SecondViewController.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 12/26/20.
//

import Foundation
import SwiftUI
import FirebaseDatabase




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



/*
 class SecondViewController: UIViewController {

    override func viewDidLoad(){
      super.viewDidLoad()
        view.backgroundColor = .systemBlue
      title = "Notifications"
    }
}
*/


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


