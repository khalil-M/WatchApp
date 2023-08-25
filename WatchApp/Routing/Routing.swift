//
//  SceneDelegate.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation
import UIKit


protocol Routing {
    var navigationController: UINavigationController? { set get }
}

// Routes

// routeToMovieDetails

protocol HomeViewRouting: Routing {
    func routeToMovieDetails(for movie: Movie)
}

