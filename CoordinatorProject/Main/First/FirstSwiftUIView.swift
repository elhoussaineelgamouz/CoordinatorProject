//
//  FirstSwiftUIView.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import SwiftUI

struct FirstSwiftUIView: View {
    @ObservedObject var viewModel: FirstTabViewModel
    var body: some View {
        VStack {
            Text("First Details")
            TextField("Name",text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

#Preview {
    FirstSwiftUIView(viewModel: FirstTabViewModel())
}
