//
//  AppCoordinator.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
   
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToMain()
    }
    
    func goToMain() {
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        let controller = MainViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToDetail() {
        let viewModel = DetailViewModel()
        let controller = DetailViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}
