//
//  DetailsVC.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/8/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleSV: UIStackView!
    @IBOutlet weak var firstDetailSV: UIStackView!
    @IBOutlet weak var secondDetailSV: UIStackView!
    @IBOutlet weak var thirdDetailSV: UIStackView!
    
    // Variables
    var charOrFilm: Bool = true
    var index: Int?
    var titleStr: String?
    var firstDetailStr: String?
    var secondDetailStr: String?
    var thirdDetailStr: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getDetails()
        setupView()
    }
    
    // Functions
    func getDetails() {
        guard let idx = index else { return }
        if charOrFilm {
            let character = DataService.instance.getCharacter(index: idx)
            titleStr = character.name
            firstDetailStr = character.gender
            secondDetailStr = character.birthYear
            thirdDetailStr = character.mass
        } else {
            let film = DataService.instance.getFilm(index: idx)
            titleStr = film.title
            firstDetailStr = film.releaseDate
            secondDetailStr = film.director
            thirdDetailStr = film.openingCrawl
        }
    }
    
    func setupView() {
        for underview in titleSV.subviews as [UIView] {
            if let label = underview as? UILabel {
                if label.tag == 1 {
                    if charOrFilm {
                        label.text = "Name"
                    } else {
                        label.text = "Title"
                    }
                } else {
                    guard let title = titleStr else { return }
                    label.text = title
                }
            }
        }
        for underview in firstDetailSV.subviews as [UIView] {
            if let label = underview as? UILabel {
                if label.tag == 1 {
                    if charOrFilm {
                        label.text = "Gender"
                    } else {
                        label.text = "Release Date"
                    }
                } else {
                    guard let title = firstDetailStr else { return }
                    label.text = title
                }
            }
        }
        for underview in secondDetailSV.subviews as [UIView] {
            if let label = underview as? UILabel {
                if label.tag == 1 {
                    if charOrFilm {
                        label.text = "Birth Year"
                    } else {
                        label.text = "Director"
                    }
                } else {
                    guard let title = secondDetailStr else { return }
                    label.text = title
                }
            }
        }
        for underview in thirdDetailSV.subviews as [UIView] {
            if let label = underview as? UILabel {
                if label.tag == 1 {
                    if charOrFilm {
                        label.text = "Mass"
                    } else {
                        label.text = "Opening Crawl"
                    }
                } else {
                    guard let title = thirdDetailStr else { return }
                    label.text = title
                }
            }
        }
    }
    
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
