//
//  EmployeeError.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import Foundation


enum EmployeeError: Error, LocalizedError {
    case invalidURL
    case serverError
    case decodeFailed
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL was invalid, please try again"
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .decodeFailed:
            return "Failed to Decode. The landmark data is invalid."
        case .unknown(let error):
            return error.localizedDescription
        }
    }

}
