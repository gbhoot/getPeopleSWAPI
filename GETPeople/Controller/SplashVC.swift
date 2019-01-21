//
//  SplashVC.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var spinnerLarge: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        downloadDataFromSWAPI()
    }
    
    // Functions
    func setupView() {
        alphaView.isHidden = false
        spinnerLarge.isHidden = false
        spinnerLarge.startAnimating()
    }
    
    func downloadDataFromSWAPI() {
        SWAPIService.instance.getJSONData(url: BASE_PEOPLE_URL, pageNumber: 1, charsOrFilms: true) { (success) in
            print(success)
            if success {
                SWAPIService.instance.getJSONData(url: BASE_FILMS_URL, pageNumber: 1, charsOrFilms: false) { (success) in
                    print(success)
                    if success {
                        self.migrateToNextView()
                    }
                }
            }
        }

    }
    
    func migrateToNextView() {
        DispatchQueue.main.async {
            self.alphaView.isHidden = true
            self.spinnerLarge.stopAnimating()
            self.spinnerLarge.isHidden = true
            self.performSegue(withIdentifier: ID_SEGUE_TO_MAIN_VC, sender: self)
        }

    }
}
