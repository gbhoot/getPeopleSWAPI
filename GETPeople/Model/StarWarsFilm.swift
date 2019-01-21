//
//  StarWarsFilm.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class StarWarsFilm {
    
    var title: String?
    var releaseDate: String?
    var director: String?
    var openingCrawl: String?
    
    init(title: String, releaseDate: String, director: String, openingCrawl: String) {
        self.title = title
        self.releaseDate = releaseDate
        self.director = director
        self.openingCrawl = openingCrawl
    }
}
