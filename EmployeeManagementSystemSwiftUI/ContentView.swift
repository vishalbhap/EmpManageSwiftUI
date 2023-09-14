//
//  ContentView.swift
//  EmployeeManagementSystemSwiftUI
//
//  Created by Vishal Bhapkar on 14/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           EmployeeListScreen()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
