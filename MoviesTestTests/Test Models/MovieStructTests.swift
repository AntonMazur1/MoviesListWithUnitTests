//
//  MovieStructCase.swift
//  MoviesTestTests
//
//  Created by Клоун on 06.08.2022.
//

import XCTest
@testable import MoviesTest

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {

    }

    //MARK: Inititalization
    func testMovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testSetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Comedy", releaseDate: "1987")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    //MARK: Equatable
    func testEquatableReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatableReturnsNotEqualForDifferentItems() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatableReturnNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "2002")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2003")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }

}
