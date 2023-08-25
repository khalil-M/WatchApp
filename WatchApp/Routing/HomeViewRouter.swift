//
//  SceneDelegate.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import UIKit

class HomeViewRouter: HomeViewRouting {
    
    var navigationController: UINavigationController?
    
    func routeToMovieDetails(for movie: Movie) {
        let vc = AppDependencies.shared.makeMovieDetailsViewController(for: movie.id )
        navigationController?.pushViewController(vc, animated: true)
    }
}
