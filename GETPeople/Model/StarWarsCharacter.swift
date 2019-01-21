//
//  StarWarsCharacter.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class StarWarsCharacter {
    
    var name: String?
    var gender: String?
    var birthYear: String?
    var mass: String
    
    init(name: String, gender: String, birthYear: String, mass: String) {
        self.name = name
        self.gender = gender
        self.birthYear = birthYear
        self.mass = mass
    }
    
}
