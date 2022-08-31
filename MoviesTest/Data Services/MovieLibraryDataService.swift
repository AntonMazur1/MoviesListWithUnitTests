//
//  MovieLibraryDataService.swift
//  MoviesTest
//
//  Created by Клоун on 10.08.2022.
//

import Foundation
import UIKit

enum Section: Int {
    case toSee
    case seen
}

class MovieLibraryDataService: NSObject {
    var movieManager: MovieManager?
}

//MARK: Table View Delegate/Data Source
extension MovieLibraryDataService: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { fatalError() }
        guard let movieManager = movieManager else { return 0 }
        
        switch section {
        case .toSee:
            return movieManager.moviesToSee
        case .seen:
            return movieManager.moviesSeen
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager = movieManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        
        let movieData = section.rawValue == 0
        ? movieManager.movieAtIndex(index: indexPath.row)
        : movieManager.checkedOffMovieAt(index: indexPath.row)
        cell.configMovieCell(movie: movieData)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        if section == .toSee {
            movieManager.checkOffMovieAt(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else  { fatalError() }
        
        switch section {
        case .toSee:
            return "Movies To See"
        case .seen:
            return "Movies Seen"
        }
    }
}
