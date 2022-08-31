//
//  MovieManagerTests.swift
//  MoviesTestTests
//
//  Created by Клоун on 06.08.2022.
//

import XCTest
@testable import MoviesTest

class MovieManagerTests: XCTestCase {
    var sut: MovieManager!
    
    let sciFiMovie = Movie(title: "Sci-Fi")
    let drama = Movie(title: "Drama")
    let blockBuster = Movie(title: "Blockbuster")
    
    override func setUpWithError() throws {
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    //MARK: Initial Values
    
    func testMoviesToSeeReturnsZero() {
        XCTAssertEqual(sut.moviesToSee, 0)
    }
    
    func testMoviesSeenReturnsZero() {
        XCTAssertEqual(sut.moviesSeen, 0)
    }
    
    //MARK: Add & Query
    
    func testMoviesToSeeReturnsOne() {
        sut.addMovie(sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSee, 1)
    }
    
    func testQueryReturnsMovieAtIndex() {
        sut.addMovie(blockBuster)
        let movieQueired = sut.movieAtIndex(index: 0)
        
        XCTAssertEqual(movieQueired.title, blockBuster.title)
    }
    
    //MARK: Checking Off
    
    func testCheckOffMovieUpdatesMovieManagerCounts() {
        sut.addMovie(drama)
        
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.moviesSeen, 1)
    }
    
    func testMovieRemovesFromRightArray() {
        sut.addMovie(sciFiMovie)
        sut.addMovie(drama)
        
        sut.checkOffMovieAt(index: 1)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, sciFiMovie.title)
    }
    
    func testCheckOffMovieReturnsMovieAtIndex() {
        sut.addMovie(drama)
        sut.checkOffMovieAt(index: 0)
        
        let movieQueired = sut.checkedOffMovieAt(index: 0)
        
        XCTAssertEqual(movieQueired.title, drama.title)
    }
    
    //MARK: Clearing and Reseting
    func testClearArraysReturnsArrayCountOfZero() {
        sut.addMovie(sciFiMovie)
        sut.addMovie(blockBuster)
        
        sut.checkOffMovieAt(index: 1)
        
        XCTAssertEqual(sut.moviesToSee, 1)
        XCTAssertEqual(sut.moviesSeen, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.moviesSeen, 0)
    }
    
    //MARK: Duplicates
    func testDuplicateMovieShouldNotBeAddedToArray() {
        sut.addMovie(sciFiMovie)
        sut.addMovie(sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSee, 1)
    }
}
