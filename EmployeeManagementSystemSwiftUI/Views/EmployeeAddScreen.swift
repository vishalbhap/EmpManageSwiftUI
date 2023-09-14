//
//  EmployeeAddScreen.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import SwiftUI

struct EmployeeAddScreen: View {

    @ObservedObject var employeeAddViewModel = EmployeeAddViewModel()
//    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingEmployeeListScreen = false

    var body: some View {
        VStack{
            Text("Add Employee")


            TextField("FirstName", text: $employeeAddViewModel.firstName)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)
            TextField("LastName", text: $employeeAddViewModel.lastName)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)
            TextField("Email", text: $employeeAddViewModel.emailId)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)

            Text(employeeAddViewModel.message)

            Button(action: {
                    employeeAddViewModel.addEmployee()
//                    presentationMode.wrappedValue.dismiss()
                    self.isShowingEmployeeListScreen.toggle()

            }) {
                Text("Add Employee")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding([.horizontal, .bottom], 20)
            }
        }
        .alert(isPresented: $employeeAddViewModel.hasError) { errorAlert }
        .sheet(isPresented: $isShowingEmployeeListScreen) {
            EmployeeListScreen()
        }

    }
}

struct EmployeeAddScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeAddScreen()
    }
}


extension EmployeeAddScreen {
    var errorAlert: Alert {
        Alert(
            title: Text("Error"),
            message: Text(employeeAddViewModel.state.localizedDescription),
            primaryButton: .default(Text("Retry"), action: employeeAddViewModel.addEmployee),
            secondaryButton: .cancel(Text("Cancel"))
        )
    }
}
