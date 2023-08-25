//
//  MovieDetailsViewControllerViewModel.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation

class MovieDetailsViewControllerViewModel {
    
    
    // vars
    let movieId: Int
    let manager: TheMDBManagerProtocol
    
    weak var delegate: MovieDetailsDelegate?
    
    var movie: Movie? = nil
    
    // constructor
    init(id: Int, manager: TheMDBManagerProtocol) {
        self.manager = manager
        self.movieId = id
    }
    
    // load movie
    func loadMovie() {
        manager.getMovie(for: movieId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let titleData):
                strongSelf.movie = titleData
                strongSelf.delegate?.reloadData()
                
            case .failure(let error):
                print("failed to fetch TitleDatga object: \(error)")
            }
        }
    }
    
    // get title
    func getTitle() -> String {
        guard let movie = movie else { return "-" }
        return movie.title
    }
    
    // get Descrition
    func getDescription() ->  String {
        guard let movie = movie else { return "-" }
        return movie.overview
    }
    
    // get Date
    func getReleaseDate() -> String {
        guard let movie = movie else { return "-" }
        return movie.release_date
    }
    
    // convert to URL
    func getImageURL() -> URL? {
        guard let movie = movie else { return nil }
        let baseURL = URL(string: "https://image.tmdb.org/t/p/")!
        let imageSize = "w500"
        
        return baseURL.appendingPathComponent(imageSize).appendingPathComponent(movie.poster_path)
    }
    
}
