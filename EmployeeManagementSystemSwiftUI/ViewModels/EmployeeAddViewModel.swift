//
//  EmployeeAddViewModel.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation

@MainActor
class EmployeeAddViewModel: ObservableObject {

    @Published var state: ViewState = .none
    @Published var hasError: Bool = false
    @Published var message: String = "Add Data"

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailId: String = ""

    private let employeeService: EmployeeAddService = EmployeeAddMockService()

    func addEmployee() {
        print("In addEmployee func")
        let emp = CustomEmployee(firstName: firstName, lastName: lastName, emailId: emailId)
        self.hasError = false
        Task {
            do {
                message = try await employeeService.addEmployee(emp: emp)
            } catch {
                self.hasError = true
                state = .failed(error: error)
            }
        }
    }
}
