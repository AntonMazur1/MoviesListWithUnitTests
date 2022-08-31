//
//  MovieCell.swift
//  MoviesTest
//
//  Created by Клоун on 11.08.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    func configMovieCell(movie: Movie) {
        var content = self.defaultContentConfiguration()
        content.text = movie.title
        content.secondaryText = movie.releaseDate
        self.contentConfiguration = content
    }

}
