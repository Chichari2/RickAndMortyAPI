//
//  allCharactersTableViewCell.swift
//  RICKandMORTY_MVVM
//
//  Created by Артем Вологдин on 08.02.24.
//

import UIKit

class allCharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var allCharactersImage: UIImageView!
    
    @IBOutlet weak var allCharactersName: UILabel!
    
    @IBOutlet weak var allCharactersGender: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
