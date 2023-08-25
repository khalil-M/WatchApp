//
//  AppDependencies.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation
import UIKit

class AppDependencies {
    var window: UIWindow?
    
    private init(){
        
    }
//    private lazy var service: AppServiceProtocol = {
//        return AppService()
//    }()
    
    static let shared = AppDependencies()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.makeKeyAndVisible()
    }
    
    public func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    func makeHomeViewController() -> UIViewController {
//        let viewModel = HomeViewControllerViewModel(service: service)
//        let router = SearchViewRouter()
//        let viewController = HomeViewController(viewModel: viewModel, router: router)
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "Home"
        navigationController.tabBarItem.image = UIImage(systemName: "house")
        viewController.view.backgroundColor = .red
//        router.navigationController = navigationController
        return navigationController
    }
    
    
//    func makeMovieDetailsViewController(for personName: String, lastName: String) -> UIViewController {
//        let viewModel = DetailViewControllerViewModel(firstName: personName, lastName: lastName)
//        let viewController = DetailViewController(viewModel: viewModel)
//        return viewController
//    }
}
