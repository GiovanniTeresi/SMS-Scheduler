//
//  MessageClass.swift
//  SMS_Scheduler
//
//  Created by Giovanni Teresi on 13/12/21.
//

import Foundation
import SwiftUI


public class MessageClass: ObservableObject {
    @Published var messages = [Message] ()
    
//    func setMessage(addressee: String, date: Date, message: String) {
//        self.messages.append(Message(addressee: addressee, date: date, message: message))
//        self.messages.last.addressee = addressee
//        self.messages.last.date = date
//        self.messages.last.message = message
//    }
}



struct Message: Identifiable  {
    let id = UUID()
    var addressee = ""
    var date = Date()
    var message = ""
}
