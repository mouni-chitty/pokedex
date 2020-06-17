//
//  ViewController.swift
//  Pokedex
//
//  Created by Mounika K on 17/06/20.
//  Copyright © 2020 Mounika K. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewPokemonProtocol {
        
    private let viewModel = PokemonViewModel()
    
    @IBOutlet weak var pokemonsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPokemons()
    }
    
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "add", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        cell.textLabel?.text = viewModel.pokemons[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.viewModel.deletePokemonAt(indexPath.row)
            self.pokemonsTableView.reloadData()
        }
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [contextualAction])
        return swipeActionConfig
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let pokemonDetailViewController = segue.destination as! PokemonDetailViewController
            pokemonDetailViewController.pokemon = LocalPokemon(pokemon: viewModel.pokemons[sender! as! Int])
        } else {
            let addPokemonViewController = segue.destination as! AddPokemonViewController
            addPokemonViewController.newPokemonProtocol = self
        }
        
    }
    
    func addPokemon(_ localPokemon: LocalPokemon) {
        viewModel.savePokemon(localPokemon)
        pokemonsTableView.reloadData()
    }
    
    
}

