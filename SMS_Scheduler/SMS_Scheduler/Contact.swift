//
//  Contact.swift
//  SMS_Scheduler
//
//  Created by Giovanni Teresi on 15/12/21.
//

import Foundation
import Combine
import Contacts

class Contact: ObservableObject {
  var dispose = Set<AnyCancellable>()
  let contactStore = CNContactStore()
  @Published var invalidPermission: Bool = false
  
  var authorizationStatus: AnyPublisher<CNAuthorizationStatus, Never> {
    Future<CNAuthorizationStatus, Never> { promise in
      self.contactStore.requestAccess(for: .contacts) { (_, _) in
        let status = CNContactStore.authorizationStatus(for: .contacts)
        promise(.success(status))
      }
    }
    .eraseToAnyPublisher()
  }
  
  func requestAccess() {
    self.authorizationStatus
      .receive(on: RunLoop.main)
      .map { $0 == .denied || $0 == .restricted }
      .assign(to: \.invalidPermission, on: self)
      .store(in: &dispose)
  }
}
