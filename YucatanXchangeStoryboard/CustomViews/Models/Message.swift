//
//  Message.swift
//  YucatanXchangeStoryboard
//
//  Created by LARRY COMBS on 1/12/21.
//

import Foundation

struct Message: Codable, Hashable {
    
    //MARK: Attributes
    var message: String
    
    init(message: String){
        self.message = message
    }
}
