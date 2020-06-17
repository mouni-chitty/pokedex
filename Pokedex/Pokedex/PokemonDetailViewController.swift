//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Mounika K on 17/06/20.
//  Copyright © 2020 Mounika K. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var pokemon: LocalPokemon?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDetails()
    }
    
    private func assignDetails() {
        
        nameLabel.text = pokemon?.name
        attackLabel.text = pokemon?.attack
        defenceLabel.text = pokemon?.defence
        hpLabel.text = pokemon?.hp
        typeLabel.text = pokemon?.type
        
    }
    
}
