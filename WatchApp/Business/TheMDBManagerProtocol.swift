//
//  TheMDBManagerProtocol.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation

public protocol TheMDBManagerProtocol {
    
    init(service: TheMDBApiServiceProtocol)
    func getMovies(completion: @escaping (Result<MovieResponse, NetworkingServiceError>) -> Void)
    func getMovie(for id: Int, completion: @escaping (Swift.Result<Movie, NetworkingServiceError>)-> Void )
}


public class TheMDBManager: TheMDBManagerProtocol {
    
    var service: TheMDBApiServiceProtocol
    
    required public init(service: TheMDBApiServiceProtocol) {
        self.service = service
    }
    
    // get list of movies
    public func getMovies(completion: @escaping (Result<MovieResponse, NetworkingServiceError>) -> Void) {
        service.getMostMovies { result in
            switch result {
            case let .failure(error):
                print(error)
                break
            case .success(_):
                completion(result)
                break
            }
        }
    }
    
    // get movie by id
    public func getMovie(for id: Int, completion: @escaping (Result<Movie, NetworkingServiceError>) -> Void) {
        service.getMovie(for: id) { result in
            switch result {
            case let .failure(error):
                print(error)
                break
            case .success(_):
                completion(result)
                break
            }
        }
    }
    
    
}
