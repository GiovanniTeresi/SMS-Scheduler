//
//  ContentView.swift
//  SMS_Scheduler
//
//  Created by Giovanni Teresi on 12/12/21.
//

import SwiftUI
import Contacts

struct ContentView: View {
    
    @ObservedObject var contact = Contact()
    @State private var selected = true
    @State private var isShowing = false
    @State private var searchString = ""
    let scheduled = ["Blue"]
    

    var shceduledMessages: [String] { // 1
        if searchString.isEmpty {
            return scheduled
        } else {
            return scheduled.filter { $0.localizedCaseInsensitiveContains(searchString) }
        }
    }
    var body: some View {
        NavigationView {
            VStack {
                Picker("Options", selection: $selected) {
                    Text("Scheduled").tag(true)
                    Text("Sent").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if selected == true {
                    Form {
                        List(shceduledMessages, id: \.self) { scheduledMessage in // 2
                            Section(header: Text("")) {
                                NavigationLink(destination: MessageView()) {
                                    Text("Addressee: Mario Rossi")
                                }
                                Text("Date: 18 december 2021 10:25 AM")
                                Text("Message: Hi Mario, Happy Birthday, i can't wait to...")
                                
                            }
                            
                        }
                    }
                }
                else {
                    Form{
                        Section(header: Text("")) {
                            NavigationLink(destination: MessageView()) {
                                Text("Addressee")
                            }
                            Text("Date:")
                            Text("Message...")
                        }
                    }
                    Spacer()
                }
            }.navigationTitle("Summary")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: SettingsView()) {
                            Text("Settings")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {

                        if isShowing == false {
                                            Button(action: {
                                                isShowing = true
                                                self.contact.requestAccess()
                                                }

                                        , label: {
                                                Image(systemName: ("square.and.pencil"))
                                            })
                                        }
                        if isShowing == true{
                            // move on case
                            NavigationLink(destination: MessageView(), isActive: $isShowing) {
                                Image(systemName: "square.and.pencil")
                            }
                        }
                    }
                }
            
                .onAppear{
                    if self.contact.invalidPermission == false {
                        isShowing = false
                    }
                }
            .searchable(text: $searchString)
        }.alert(isPresented: self.$contact.invalidPermission) {
            Alert(
              title: Text("Warning"),
              message: Text("Please go to Settings and turn on the permissions"),
              primaryButton: .cancel(Text("Cancel")),
              secondaryButton: .default(Text("Settings"), action: {
                if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
              }))
          }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



