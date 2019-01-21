//
//  CharacterCell.swift
//  GETPeople
//
//  Created by Gurpal Bhoot on 11/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(index: Int, name: String) {
        indexLabel.text = "\(index)"
        characterNameLabel.text = name
    }
}
