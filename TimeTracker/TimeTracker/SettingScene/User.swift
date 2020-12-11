//
//  UserModel.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/24/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import Foundation

struct User {
  let name: String?
  let department: String?
  let codeId: String?
  let email: String?
  
  func getLabels() -> [String] {
    return ["Họ Tên", "Trung tâm", "Mã nhân viên", "Email"]
  }
  
  func getValues() -> [String?] {
    return [name, department, codeId, email]
  }
}
