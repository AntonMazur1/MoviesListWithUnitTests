//
//  Movie.swift
//  MoviesTest
//
//  Created by Клоун on 06.08.2022.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}


extension Movie {
    static func==(lhs: Movie, rhs: Movie) -> Bool {
        if lhs.title != rhs.title {
            return false
        }
        
        if lhs.releaseDate != rhs.releaseDate {
            return false
        }
        
        return true
    }
}
