//
//  MovieResponse.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation
public struct MovieResponse: DTO {
    var results: [Movie]
    
    
    public var description: String {
        return """
        ------------
        results = \(results)
        ------------
        """
    }
}
