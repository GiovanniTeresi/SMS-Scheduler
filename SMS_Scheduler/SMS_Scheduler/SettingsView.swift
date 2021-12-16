//
//  SettingsView.swift
//  SMS_Scheduler
//
//  Created by Giovanni Teresi on 13/12/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Form{
                Section {
                    HStack {
                        Text("Manage Notification")
                        Spacer()
                        Button(action: do_nothing) {
                            Image(systemName: "chevron.right")
                        }
                    }
                    HStack {
                        Text("Manage Permission")
                        Spacer()
                        Button(action: nothing) {
                            Image(systemName: "chevron.right")
                        }
                    }
                    HStack {
                        Text("Upgrade Pro Version")
                        Spacer()
                        Button(action: do_nothing) {
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

func nothing() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
    
    
}
