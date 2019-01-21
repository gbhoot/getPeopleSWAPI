//
//  Constants.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ completion: Bool) -> ()

// SWAPI API URLS
let BASE_PEOPLE_URL             =   "http://swapi.co/api/people/?page="
let BASE_FILMS_URL              =   "http://swapi.co/api/films/"

// Cell Reuse IDs
let ID_REUSE_CHARACTER_CELL     =   "characterCell"

// Storyboard Segue IDs
let ID_SEGUE_TO_MAIN_VC         =   "toMainVC"
let ID_SEGUE_TO_DETAILS_VC      =   "toDetailsVC"
