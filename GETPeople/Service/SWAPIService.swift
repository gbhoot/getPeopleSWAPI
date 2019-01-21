//
//  SWAPIService.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class SWAPIService {
    
    static let instance = SWAPIService()
    
    var jsonResults: NSDictionary?
    var foundAll = false
    
    // Functions
    func getJSONData(url: String, pageNumber: Int, charsOrFilms: Bool, completion: @escaping CompletionHandler) {
        var urlz = URL(string: url)
        if charsOrFilms {
            urlz = URL(string: url+String(pageNumber))
        }
        let session = URLSession.shared
        let task = session.dataTask(with: urlz!, completionHandler:  {
            (data, response, error) in
            guard let retrievedData = data else { return }
            
            do {
                guard let jsonData = try JSONSerialization.jsonObject(with: retrievedData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary else { return }
                print("Got the data")
                
                self.jsonResults = jsonData
                if charsOrFilms {
                    self.getCharactersFromResults()
                } else {
                    self.getFilmsFromResults()
                }
                if self.checkIfNextIsNotNull() {
                    self.foundAll = false
                    self.getJSONData(url: BASE_PEOPLE_URL, pageNumber: pageNumber+1, charsOrFilms: true, completion: { (success) in
                        if success {
                            if self.foundAll {
                                completion(true)
                            }
                        }
                    })
                } else {
                    print("Next doesn't exist")
                    self.foundAll = true
                    completion(true)
                }
                
                
            } catch {
                print("Can't do get request: \(error), \(error.localizedDescription)")
                completion(false)
            }
        })
        
        task.resume()
    }
    
    func getCharactersFromResults() {
        guard let jsonData = self.jsonResults else { return }
        
        if let results = jsonData["results"] as? NSArray {
            for result in results {
                if let resultDictionary = result as? [String: AnyObject] {
                    DataService.instance.addCharacter(name: resultDictionary["name"] as! String, gender: resultDictionary["gender"] as! String, birthYear: resultDictionary["birth_year"] as! String, mass: resultDictionary["mass"] as! String)
                }
            }
        }
    }

    func getFilmsFromResults() {
        guard let jsonData = self.jsonResults else { return }
        
        if let results = jsonData["results"] as? NSArray {
            for result in results {
                if let resultDictionary = result as? [String: AnyObject] {
                    DataService.instance.addFilm(title: resultDictionary["title"] as! String, releaseDate: resultDictionary["release_date"] as! String, director: resultDictionary["director"] as! String, openingCrawl: resultDictionary["opening_crawl"] as! String)
                }
            }
        }
    }

    func checkIfNextIsNotNull() -> Bool {
        guard let jsonData = self.jsonResults else { return false }
        
        if let next = jsonData["next"] as? String {
            if next != "<null>" {
                return true
            }
        }
        
        let characters = DataService.instance.returnCharacters()
        print(characters.count)
        return false
    }
}


