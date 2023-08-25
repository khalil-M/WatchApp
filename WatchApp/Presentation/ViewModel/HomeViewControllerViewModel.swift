//
//  HomeViewControllerViewModel.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation

class HomeViewControllerViewModel {
    
    ///vars
    private var manager: TheMDBManagerProtocol
    
    var reloadTableView: () -> Void = { }
    
    public var movies: [Movie] = []
    
    init(manager: TheMDBManagerProtocol) {
        self.manager = manager
    }
    
    
    // getData
    public func getData() {
        manager.getMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.movies = response.results
                    self?.reloadTableView()
                    break
                case .failure(let error):
                    print("Failed to fetch most popular movies: \(error)")
                }
            }
        }
    }
    
    // get movie at specific index
    func itemAt(indexPath: IndexPath) -> Movie {
        getData()
        return movies[indexPath.row]
    }
    
}
