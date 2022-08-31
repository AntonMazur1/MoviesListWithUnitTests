//
//  ViewController.swift
//  MoviesTest
//
//  Created by Клоун on 06.08.2022.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
        dataService.movieManager = movieManager
        dataService.movieManager?.addMovie(Movie(title: "Action Movie", releaseDate: "1922"))
        dataService.movieManager?.addMovie(Movie(title: "Fairy Movie", releaseDate: "1952"))
        dataService.movieManager?.addMovie(Movie(title: "Best Movie", releaseDate: "2004"))
        
        libraryTableView.reloadData()
    }


}

