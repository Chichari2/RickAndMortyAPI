//
//  CharacterViewController.swift
//  RICKandMORTY_MVVM
//
//  Created by Артем Вологдин on 08.02.24.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterLiveStatus: UILabel!
    @IBOutlet weak var characterSpeciesUndGender: UILabel!
    @IBOutlet weak var characterLastKnownLocation: UILabel!
    @IBOutlet weak var characterPlanetLabel: UILabel!
    @IBOutlet weak var characterCreatedLabel: UILabel!
    
    var character: ResultsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        characterName.text = character?.name
        characterLiveStatus.text = character?.status
        characterSpeciesUndGender.text = character?.species
        characterLastKnownLocation.text = character?.location.name
        characterPlanetLabel.text = character?.origin.name
        characterCreatedLabel.text = character?.created
        
        let imageURL = (character?.image)!
        characterImage.downloaded(from: imageURL)
    }
    


}
