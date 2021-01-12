//
//  DataTableStore.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 1/12/21.
//


import SwiftUI
import Combine
import Firebase
import FirebaseFirestoreSwift
import CodableFirebase
import FirebaseFirestore

class DataTableStore : ObservableObject {
    static let TABLE_NAME = "DataTable"
    
    let db = Firestore.firestore()
    var didChange = PassthroughSubject<DataTableStore, Never>()
    
    @Published var loading = true
    @Published var messages: [Message] = [] {
        didSet { self.didChange.send(self) }
    }
    
    init(messages: [Message] = []) {
        self.messages = messages
    }
    
    func listenDataTables(){
        db.collection(DataTableStore.TABLE_NAME).addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            do {
                self.messages.removeAll()
                try snapshot.documents.forEach { document in
                    let message = try document.data(as: Message.self)
                    if(nil != message){
                        self.messages.append(message!)
                    }
                }
                
            }
            catch {
                print("Error fetching document: \(error.localizedDescription)")
            }
            self.loading=false
        }
    }
}

