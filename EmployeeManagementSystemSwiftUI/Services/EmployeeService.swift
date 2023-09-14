//
//  EmployeeService.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation

protocol EmployeeService {
    func fetchEmployees() async throws -> [Employee]
}

// Implementation of LandmarkService using an actual API.
class EmployeeAPIService: EmployeeService {
    func fetchEmployees() async throws -> [Employee] {
        let urlString = "http://localhost:8080/api/v1/employees"
        guard let url = URL(string: urlString) else {
            throw EmployeeError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw EmployeeError.serverError
        }
        do {
            let decodedData = try JSONDecoder().decode([Employee].self, from: data)
            return decodedData
        } catch {
            throw EmployeeError.decodeFailed
        }
    }
}

// Mock implementation of EmployeeService for testing purposes.
class EmployeeMockService: EmployeeService {
     func fetchEmployees() async throws -> [Employee] {
        let employees: [Employee] = [
            Employee(firstName: "Vishal", lastName: "Bhapkar", emailId: "vishalbhap@cybage.com", id: 1),
            Employee(firstName: "Shubham", lastName: "Suradkar", emailId: "shubham@cybage.com", id: 2),
            Employee(firstName: "Sanket", lastName: "Mule", emailId: "sanket@cybage.com", id: 3),
            Employee(firstName: "Yogiraj", lastName: "Patil", emailId: "yogiraj@cybage.com", id: 4)
        ]
        return employees
    }
}
