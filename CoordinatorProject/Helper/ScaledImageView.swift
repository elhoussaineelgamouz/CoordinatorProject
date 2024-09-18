//
//  ScaledImageView.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}

