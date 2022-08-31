//
//  MockExtension.swift
//  MoviesTestTests
//
//  Created by Клоун on 11.08.2022.
//

import XCTest
@testable import MoviesTest

extension MovieDataServiceTest {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MovieCellMock.self, forCellReuseIdentifier: "movieCell")
            
            return mockTableView
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
}


extension MovieCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }
    }
}
