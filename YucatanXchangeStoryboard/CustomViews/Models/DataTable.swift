//
//  DataTable.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 1/12/21.
//

import Foundation

struct DataTable: Codable {
    
    //MARK: Attributes
    var id: String
    var messages: [Message]
        
    static let `default` = Self(
        id: "defaultid",
        messages: [Message]()
    )
    
    init(id: String, messages: [Message]){
        self.id = id
        self.messages = messages
    }
}
