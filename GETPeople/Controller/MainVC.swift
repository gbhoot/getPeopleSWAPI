//
//  ViewController.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var charactersTableView: UITableView!
    @IBOutlet weak var charsFilmsSegmented: UISegmentedControl!
    
    // Variables
    var characters = [StarWarsCharacter]()
    var films = [StarWarsFilm]()
    var index: Int?
    var charOrFilm: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        self.characters = DataService.instance.returnCharacters()
        self.films = DataService.instance.returnFilms()
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        updateTableData()
    }
    
    // Functions
    func updateTableData() {
        self.charactersTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailsVC
        destination?.index = index!
        destination?.charOrFilm = charOrFilm
    }
    
    // IB-Actions
    @IBAction func charsFilmsChanged(_ sender: Any) {
        guard let SC = sender as? UISegmentedControl else { return }
        if SC.selectedSegmentIndex == 0 {
            charOrFilm = true
        } else {
            charOrFilm = false
        }
        updateTableData()
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if charOrFilm {
            return self.characters.count
        } else {
            return self.films.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ID_REUSE_CHARACTER_CELL) as? CharacterCell else { return UITableViewCell() }
        
        if charOrFilm {
            let character = characters[indexPath.row]
            cell.configureCell(index: indexPath.row+1, name: character.name!)
        } else {
            let film = films[indexPath.row]
            cell.configureCell(index: indexPath.row+1, name: film.title!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: ID_SEGUE_TO_DETAILS_VC, sender: self)
        
    }
}

