//
//  EmployeeAddService.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation

protocol EmployeeAddService {
    func addEmployee(emp: CustomEmployee) async throws -> String
}

// Implementation of LandmarkService using an actual API.
class EmployeeAddAPIService: EmployeeAddService {
    func addEmployee(emp: CustomEmployee) async throws -> String {
       return "Hi"
    }
}

// Mock implementation of EmployeeService for testing purposes.
class EmployeeAddMockService: EmployeeAddService {
     func addEmployee(emp: CustomEmployee) async throws -> String {
//        let e1 = Employee(firstName: "Vishal2", lastName: "Bhapkar2", emailId: "vishal2bhap@cybage.com", id: 1)
         print("In addEmployee service func")
         let urlString = "http://localhost:8080/api/v1/employees"

         guard let url = URL(string: urlString) else {
             throw EmployeeError.invalidURL
         }
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")

         print("In addEmployee service func2")
         let jsonEmployee = try JSONEncoder().encode(emp)
         request.httpBody = jsonEmployee

         let (_, response) = try await URLSession.shared.data(for: request)

         print("In addEmployee service func3")
         print(response)
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
             throw EmployeeError.serverError
         }

         print("In addEmployee service func4")
         return "Data Added"
    }
}
