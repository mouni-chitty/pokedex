//
//  AddPokemonViewController.swift
//  Pokedex
//
//  Created by Mounika K on 17/06/20.
//  Copyright © 2020 Mounika K. All rights reserved.
//

import UIKit

protocol NewPokemonProtocol: class {
    func addPokemon(_ localPokemon: LocalPokemon)
}

class AddPokemonViewController: UIViewController, UITextFieldDelegate  {
    
    weak var newPokemonProtocol : NewPokemonProtocol?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var attackTextField: UITextField!
    @IBOutlet weak var defenceTextField: UITextField!
    @IBOutlet weak var hpTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        if nameTextField.text?.isEmpty ?? true {
            showAlert(title: "Name", message: "Please enter pokemon name")
            return
        }
        
        if attackTextField.text?.isEmpty ?? true {
            showAlert(title: "Attack", message: "Please enter pokemon attack")
            return
        }
        if defenceTextField.text?.isEmpty ?? true {
            showAlert(title: "Defence", message: "Please enter pokemon defence")
            return
        }
        if hpTextField.text?.isEmpty ?? true {
            showAlert(title: "HP", message: "Please enter pokemon HP")
            return
        }
        if typeTextField.text?.isEmpty ?? true {
            showAlert(title: "Type", message: "Please enter pokemon type")
            return
        }
        
        let localPokemon = LocalPokemon(name: nameTextField.text, attack: attackTextField.text, defence: defenceTextField.text, hp: hpTextField.text, type: typeTextField.text)
        newPokemonProtocol?.addPokemon(localPokemon)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            attackTextField.becomeFirstResponder()
        } else if textField == attackTextField {
            defenceTextField.becomeFirstResponder()
        } else if textField == defenceTextField {
            hpTextField.becomeFirstResponder()
        } else if textField == hpTextField {
            typeTextField.becomeFirstResponder()
        } else {
            typeTextField.resignFirstResponder()
        }
        return true
    }
    
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController.init(title:title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAlertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}
