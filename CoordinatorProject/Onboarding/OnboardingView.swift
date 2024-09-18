//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import SwiftUI

struct OnboardingView: View {

    var doneRequested: () -> ()
    var body: some View {
        TabView {
            ScaledImageView(name: "animal1")
                .tag(0)
            ScaledImageView(name: "animal2")
                .tag(1)
            ScaledImageView(name: "animal3")
                .tag(2)
            ScaledImageView(name: "animal4")
                .tag(3)
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(.page)
        .background(Color(.black).ignoresSafeArea(.all))
    }
}

#Preview {
    OnboardingView(doneRequested: {})
}

