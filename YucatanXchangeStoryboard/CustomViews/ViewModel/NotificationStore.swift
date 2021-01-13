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

class NotificationStore : ObservableObject {
    static let TABLE_NAME = "Notifications"
    
    let db = Firestore.firestore()
    var didChange = PassthroughSubject<NotificationStore, Never>()
    
    @Published var loading = true
    @Published var notifications: [NotificationData] = [] {
        didSet { self.didChange.send(self) }
    }
    
    init(notifications: [NotificationData] = []) {
        self.notifications = notifications
    }
    
    func listenDataTables(){
        db.collection(NotificationStore.TABLE_NAME).addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            do {
                self.notifications.removeAll()
                try snapshot.documents.forEach { document in
                    let message = try document.data(as: NotificationData.self)
                    if(nil != message){
                        self.notifications.append(message!)
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

