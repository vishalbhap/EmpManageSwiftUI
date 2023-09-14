//
//  EmployeeViewModel.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation

@MainActor
class EmployeeViewModel: ObservableObject {

    @Published var state: ViewState = .none
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
                state = .failed(error: error)
            }
        }
    }
}




enum ViewState {
    case none
    case loading
    case success
    case failed(error: Error)
    case noTextInput
    case dataEmpty

    var localizedDescription: String {
        switch self {
        case .none: return "No state"
        case .loading: return "Loading"
        case .success: return "Success"
        case .failed(let error): return error.localizedDescription
        case .noTextInput: return "No input"
        case .dataEmpty: return "No Data available"
        }
    }
}
