//
//  MovieCellTests.swift
//  MoviesTestTests
//
//  Created by Клоун on 12.08.2022.
//

import XCTest
@testable import MoviesTest

class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewController") as? LibraryViewController
        _ = controller?.loadViewIfNeeded()
        tableView = controller?.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        
    }
    
    func testCellConfigShoudSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: IndexPath(row: 0, section: 0)) as? MovieCell
        cell?.configMovieCell(movie: Movie(title: "Indie Comedy", releaseDate: "2018"))
        let cellContent = cell?.contentConfiguration as? UIListContentConfiguration
        
        XCTAssertEqual(cellContent?.text, "Indie Comedy")
        XCTAssertEqual(cellContent?.secondaryText, "2018")
    }

}
