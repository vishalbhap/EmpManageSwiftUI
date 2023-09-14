//
//  EmployeeResponse.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation

//struct EmployeeResponse: Codable {
//    let employees: [Employee]
//}

struct Employee: Codable, Identifiable {
    let firstName: String
    let lastName: String
    let emailId: String
    let id: Int
}
