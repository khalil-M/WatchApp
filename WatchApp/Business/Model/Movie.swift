//
//  Movie.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation
public struct Movie: DTO {
    var id: Int
    var title: String
    var original_language: String
    var overview: String
    var poster_path: String
    var backdrop_path: String
    var popularity: Double
    var vote_average: Double
    var vote_count: Int
    var video: Bool
    var adult: Bool
    var release_date: String
    
    
    
    public var description: String {
        return """
        ------------
        id = \(id)
        title = \(title)
        original_language = \(original_language)
        overview = \(overview)
        poster_path = \(poster_path)
        backdrop_path = \(backdrop_path)
        popularity = \(popularity)
        vote_average = \(vote_average)
        vote_count = \(vote_count)
        video = \(video)
        adult = \(adult)
        release_date = \(release_date)
        ------------
        """
    }
}
