//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by El houssaine El GAMOUZ on 18/7/2024.
//

import Foundation
import SwiftUI
import UIKit

class FirstTabCoordinator: Coordinator {

    var rootViewController: UINavigationController
    let viewModel = FirstTabViewModel()

    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.title =  "First Title"
        vc.viewModel = viewModel
        vc.showDetailsRequested = { [weak self] in
            self?.goToDetail()
        }
        return vc
    }()

    func start() {
        self.rootViewController.setViewControllers([firstViewController], animated: false)
    }

    func goToDetail() {
        let detailViewController = UIHostingController(rootView: FirstSwiftUIView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }

}
