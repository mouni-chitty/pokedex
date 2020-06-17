
//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Mounika K on 17/06/20.
//  Copyright © 2020 Mounika K. All rights reserved.
//

import UIKit
import CoreData

struct LocalPokemon {
    var name: String?
    var attack: String?
    var defence: String?
    var hp: String?
    var type: String?
    
    init(name: String?, attack: String?, defence: String?, hp: String?, type: String?) {
        self.name = name
        self.attack = attack
        self.defence = defence
        self.hp = hp
        self.type = type
    }
    
    init(pokemon: Pokemon) {
        self.name = pokemon.name
        self.attack = pokemon.attack
        self.defence = pokemon.defence
        self.hp = pokemon.hp
        self.type = pokemon.type
    }
}

class PokemonViewModel {
    
   private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pokemons: [Pokemon] = []
    
    func getPokemons() {
        
        let fetchRequest : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        do {
            self.pokemons = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func savePokemon(_ newPokemon: LocalPokemon) {
        
        let pokemon = Pokemon(context: context)
        pokemon.name = newPokemon.name
        pokemon.attack = newPokemon.attack
        pokemon.defence = newPokemon.defence
        pokemon.hp = newPokemon.hp
        pokemon.type = newPokemon.type
        pokemon.id = UUID().uuidString + Date().timeIntervalSince1970.description
        do {
            try context.save()
            pokemons.append(pokemon)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deletePokemonAt(_ index: Int) {
        context.delete(pokemons[index])
    }
    
    
    
    
    
    
}
