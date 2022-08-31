//
//  DataServiceTest.swift
//  MoviesTestTests
//
//  Created by Клоун on 10.08.2022.
//

import XCTest
@testable import MoviesTest

class MovieDataServiceTest: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var controller: LibraryViewController!
    var mockTableView: MockTableView!
    
    let fairyTale = Movie(title: "fairyTale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")
    
    override func setUpWithError() throws {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        mockTableView = MockTableView.initMock(dataSource: sut)
        
        controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewController") as? LibraryViewController
        controller.loadViewIfNeeded()
        
        libraryTableView = controller.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        
    }

    //MARK: Sections
    func testTableViewSectionsCountReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    //MARK: Cells
    func testCellAtIndexPathReturnsMovieCell() {
        sut.movieManager?.addMovie(thriller)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        sut.movieManager?.addMovie(darkComedy)
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellIsDequeued)
    }
    
    func testCellSectionOneShouldSetCellData() {
        sut.movieManager?.addMovie(fairyTale)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, fairyTale)
    }
    
    func testCellSectionTwoShouldSetCellData() {
        sut.movieManager?.addMovie(fairyTale)
        sut.movieManager?.checkOffMovieAt(index: 0)
        
        mockTableView.reloadData()
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, fairyTale)
    }
    
    func testCellSelectionShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(thriller)
        sut.movieManager?.addMovie(darkComedy)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSee, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeen, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitlesShouldHaveCorrectStringValues() {
        let sectionOneTitle = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let sectionTwoTitle = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(sectionOneTitle, "Movies To See")
        XCTAssertEqual(sectionTwoTitle, "Movies Seen")
    }
}
