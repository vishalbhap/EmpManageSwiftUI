//
//  EmployeeListScreen.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import SwiftUI

struct EmployeeListScreen: View {

    @ObservedObject var employeeViewModel = EmployeeViewModel()
    @State private var isShowingEmployeeAddScreen = false // Add this state
    
    var body: some View {
        NavigationView {
            List(employeeViewModel.employees) { employee in
                NavigationLink(
                    destination: EmployeeDetailView(employee: employee)) {
                    Text(employee.firstName)
                }
            }
            .navigationBarTitle("Employee List")
            .onAppear(){
                employeeViewModel.fetchEmployees()
            }
            .alert(isPresented: $employeeViewModel.hasError) { errorAlert }
            .navigationBarItems(trailing: Button(action: {
                            self.isShowingEmployeeAddScreen.toggle()
                        }) {
                            Text("Add Employee")
                        })
                        .sheet(isPresented: $isShowingEmployeeAddScreen) {
                            EmployeeAddScreen()
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

extension EmployeeListScreen {
    var errorAlert: Alert {
        Alert(
            title: Text("Error"),
            message: Text(employeeViewModel.state.localizedDescription),
            primaryButton: .default(Text("Retry"), action: employeeViewModel.fetchEmployees),
            secondaryButton: .cancel(Text("Cancel"))
        )
    }
}
