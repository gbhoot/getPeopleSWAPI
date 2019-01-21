//
//  DataService.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var characters = [StarWarsCharacter]()
    private var films = [StarWarsFilm]()
    
    // Functions
    func addCharacter(name: String, gender: String, birthYear: String, mass: String) {
        let character = StarWarsCharacter(name: name, gender: gender, birthYear: birthYear, mass: mass)
        characters.append(character)
    }
    
    func addFilm(title: String, releaseDate: String, director: String, openingCrawl: String) {
        let film = StarWarsFilm(title: title, releaseDate: releaseDate, director: director, openingCrawl: openingCrawl)
        films.append(film)
    }
    
    func getCharacter(index: Int) -> StarWarsCharacter {
        return characters[index]
    }
    
    func getFilm(index: Int) -> StarWarsFilm {
        return films[index]
    }
    
    func returnCharacters() -> [StarWarsCharacter] {
        return characters
    }
    
    func returnFilms() -> [StarWarsFilm] {
        return films
    }
}
