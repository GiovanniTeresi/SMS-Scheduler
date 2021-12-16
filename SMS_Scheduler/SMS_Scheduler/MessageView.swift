//
//  MessageView.swift
//  SMS_Scheduler
//
//  Created by Giovanni Teresi on 13/12/21.
//

import SwiftUI

struct MessageView: View {
    @State private var contact = ""
    @State private var message1 = ""
    @State private var date1 = Date()
//    @State var messageList = [Message] ()
    @ObservedObject private var messageList = MessageClass()
    @State private var mesg_el = Message()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack(spacing: 10){
                        Text("To:")
                        TextField ("Contact", text: $contact)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 270)
                        Button(action: do_nothing) {
                            Image(systemName: "plus.circle")
                        }
                    }
                    DatePicker("Date:", selection: $date1, in: Date()...)

                }
                Section (header: Text("Text")) {
                    TextEditor(text: $message1)
                        
                }
                
                if self.messageList.messages.isEmpty == false {
                    Section {
                        HStack {
                            Text(date1, style: .date)
                            Text(date1, style: .time)
                        }
                    }
                }
                
            }
        }.navigationBarTitle("Schedule Message", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Schedule") {
//                    if self.messageList.messages.isEmpty == true {
//                        self.messageList.messages[self.messageList.messages.startIndex] = Message(addressee: contact, date: date1, message: message1)
//
//                    } else  {
//                        self.messageList.messages.append(Message(addressee: contact, date: date1, message: message1))
//                    }
                    self.messageList.messages.append(Message(addressee: contact, date: date1, message: message1))
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}




func do_nothing() {
    
}



