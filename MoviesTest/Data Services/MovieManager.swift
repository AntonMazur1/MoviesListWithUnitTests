//
//  MovieManager.swift
//  MoviesTest
//
//  Created by Клоун on 06.08.2022.
//

import Foundation

class MovieManager {
    var moviesToSee: Int {
        moviesToSeeArray.count
    }
    
    var  moviesSeen: Int {
        moviesSeenArray.count
    }
    
    private var moviesToSeeArray: [Movie] = []
    private var moviesSeenArray: [Movie] = []
    
    func addMovie(_ movie: Movie) {
        if !moviesToSeeArray.contains(movie) {
            moviesToSeeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
        moviesToSeeArray[index]
    }
    
    func checkOffMovieAt(index: Int) {
        guard index < moviesToSeeArray.count else { return }
        let seenMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(seenMovie)
    }
    
    func checkedOffMovieAt(index: Int) -> Movie {
        moviesSeenArray[index]
    }
    
    func clearArrays() {
        moviesToSeeArray.removeAll()
        moviesSeenArray.removeAll()
    }
}
