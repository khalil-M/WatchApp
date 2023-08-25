//
//  TheMDBApiServiceProtocol.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation


public protocol TheMDBApiServiceProtocol {
    typealias ServiceError = NetworkingServiceError
    init(baseURL: URL, client: HTTPClient, apiKey: String)
    
    // MARK: - Browse
    func getMostMovies(completion: @escaping (Swift.Result<MovieResponse, ServiceError>)->Void)
    func getMovie(for id: Int, completion: @escaping (Swift.Result<Movie, ServiceError>)-> Void )
}

public class TheMDBApiService: TheMDBApiServiceProtocol {
    
    private var baseURL: URL
    private var client: HTTPClient
    private var apiKey: String
    
    public required init(baseURL: URL, client: HTTPClient, apiKey: String) {
        self.baseURL = baseURL
        self.client = client
        self.apiKey = apiKey
    }
 
    // get list of movies
    public func getMostMovies(completion: @escaping (Result<MovieResponse, ServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent("popular")
            .appendingQueryItem(name: "api_key", value: apiKey)
            .appendingQueryItem(name: "language", value: "en-US")
            .appendingQueryItem(name: "page", value: "1")
        
        client.makeRequest(toURL: url, withHttpMethod: .get) { [weak self] result in
            guard self != nil else { return }
            
            completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
    // get movie by id
    public func getMovie(for id: Int, completion: @escaping (Result<Movie, ServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent(String(id))
            .appendingQueryItem(name: "api_key", value: apiKey)
            .appendingQueryItem(name: "language", value: "en-US")
            .appendingQueryItem(name: "page", value: "1")
        
        client.makeRequest(toURL: url, withHttpMethod: .get) { [weak self] result in
            guard self != nil else { return }
            
            completion(GenericDecoder.decodeResult(result: result))
        }
    }

    
}


