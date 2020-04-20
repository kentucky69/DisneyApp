//
//  ViewController.swift
//  disneyApp
//
//  Created by Ken Gassy on 20/04/2020.
//  Copyright © 2020 Ken Gassy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultIV: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var genderButton: [UIButton]!
    @IBOutlet var placeButton: [UIButton]!
    @IBOutlet weak var tittleLabel: UILabel!
    
    // Mes Variables et Constantes
    let radius:CGFloat = 15
    var selectedGender = 0
    var selectedPlace = 0
    
    var hommes = ["mowgli", "kuzco", "aladdin"]
    var femmes = ["pocahontas", "raiponce", "esmeralda"]
    var animaux = ["timon", "la bete", "remi"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tittleLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(reset))
        tittleLabel.addGestureRecognizer(tap)
    }
    
    /*==============================================================**/
    
    // Les parmatres de mon app
    func setupUI() {
        resultLabel.clipsToBounds = true
        resultLabel.layer.cornerRadius = radius
        setupButtonsCollection(genderButton, selectedGender)
        setupButtonsCollection(placeButton, selectedPlace)
    }
    /*==============================================================**/
    
    // Parametrage style de mes bouttons
    func setupButtonsCollection(_ array: [UIButton],_ index:Int) {
        for x in (0..<array.count) {
            array[x].layer.cornerRadius = radius
            if index == x + 1 {
                array[x].backgroundColor = .systemTeal
            } else {
                array[x].backgroundColor = .lightGray
            }
        }
    }
    /*==============================================================**/
    
    // Switch celon le choix du personnages et de l habitation
    func getStringFromArray() -> String {
        switch selectedGender {
        case 1: return hommes[selectedPlace - 1]
        case 2: return femmes[selectedPlace - 1]
        default: return animaux[selectedPlace - 1]
        }
    }
    
    /*==============================================================**/
    // Function de la class reset
    @objc func reset() {
        selectedPlace = 0
        selectedGender = 0
        resultLabel.text = " "
        resultIV.image = nil
        setupUI()
    }
    /*==============================================================**/
    
    // RESULTAT
    @IBAction func getResult(_ sender: Any) {
        if selectedGender != 0 && selectedPlace != 0 {
            resultLabel.text = "Vous êtes: " + getStringFromArray().capitalized
            resultIV.image = UIImage(named: getStringFromArray())
        } else {
            resultLabel.text = "Veuillez choisir les valeurs pour continuer"
        }
    }
    /*==============================================================**/
    
    //Mes évenements d'actions
    @IBAction func genderPressed(_ sender: UIButton) {
        selectedGender = sender.tag
        setupButtonsCollection(genderButton, selectedGender)
    }
    
    @IBAction func placePressed(_ sender: UIButton) {
        selectedPlace = sender.tag
        setupButtonsCollection(placeButton, selectedPlace)
    }
    
    
}

