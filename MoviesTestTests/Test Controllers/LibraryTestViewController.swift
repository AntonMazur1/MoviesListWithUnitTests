//
//  LibraryTestViewController.swift
//  MoviesTestTests
//
//  Created by Клоун on 10.08.2022.
//

import XCTest
@testable import MoviesTest

class LibraryTestViewController: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main",
                           bundle: nil).instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
        _ = sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
    }

    //MARK: Nil Checks
    func testLibraryVCTableViewNotNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    //MARK: Data Source
    func testDataSourceSetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: Delegate
    func testDelegateSetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data Service Assumptions
    func testDataServiceSingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }
}
