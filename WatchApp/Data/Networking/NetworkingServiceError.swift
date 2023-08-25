//
//  AppDelegate.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation

public enum NetworkingServiceError: Swift.Error {
    case connectivity
    case invalidData
    case badRequest
    case notAuthorized
}
