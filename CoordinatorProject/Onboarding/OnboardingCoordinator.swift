//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import Foundation
import SwiftUI
import UIKit
import Combine

class OnboardingCoordinator: Coordinator {

    var rootViewController = UIViewController()
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>

    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
}
