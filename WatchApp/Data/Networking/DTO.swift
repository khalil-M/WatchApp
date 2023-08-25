//
//  AppDelegate.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import Foundation

public protocol DTO: Codable, CustomStringConvertible, Hashable {
    
}

extension Array: DTO where Element: DTO
{
    
}

