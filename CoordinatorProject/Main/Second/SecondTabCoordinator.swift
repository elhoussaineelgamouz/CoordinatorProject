//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import Foundation
import UIKit


class SecondTabCoordinator: Coordinator {

    var rootViewController = UINavigationController()

    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}

