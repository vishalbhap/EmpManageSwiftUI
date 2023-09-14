//
//  EmployeeViewModel.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation

@MainActor
class EmployeeViewModel: ObservableObject {

    @Published var hasError: Bool = false
    @Published var employees: [Employee] = []

    private let employeeService: EmployeeService = EmployeeAPIService()

    func fetchEmployees() {
        self.hasError = false
        Task {
            do {
                let employeesResponse = try await employeeService.fetchEmployees()
                self.employees = employeesResponse
            } catch {
                self.hasError = true
            }
        }
    }
}
