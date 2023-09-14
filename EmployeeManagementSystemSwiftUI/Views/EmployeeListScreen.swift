//
//  EmployeeListScreen.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import SwiftUI

struct EmployeeListScreen: View {

    @ObservedObject var employeeViewModel = EmployeeViewModel()
    
    var body: some View {
        NavigationView {
            List(employeeViewModel.employees) { employee in
                NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                    Text(employee.firstName)
                }
            }
            .navigationBarTitle("Employee List")
            .onAppear(){
                employeeViewModel.fetchEmployees()
            }
        }
    }
}

struct EmployeeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListScreen()
    }
}

struct EmployeeDetailView: View {
    let employee: Employee

    var body: some View {
        Text("Hi")
    }
}
