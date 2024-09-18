//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import Foundation
import SwiftUI
import UIKit
import Combine

class ApplicationCoordinator: Coordinator {

    let window: UIWindow?

    var childCoordinators = [Coordinator]()
    var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        setupOnboardingValue()
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
                if hasSeen {
                    let mainCoordinator = MainCoordinator()
                    mainCoordinator.start()
                    self?.childCoordinators = [mainCoordinator]
                    self?.window?.rootViewController = mainCoordinator.rootViewController
                } else if let hasSeenOnboarding =  self?.hasSeenOnboarding {
                    let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                    onboardingCoordinator.start()
                    self?.childCoordinators = [onboardingCoordinator]
                    self?.window?.rootViewController = onboardingCoordinator.rootViewController
                }
            }
            .store(in: &subscriptions)
    }

    func setupOnboardingValue() {
        // storing and loading of state/data
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(value)
        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
    }

}
