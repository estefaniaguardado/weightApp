//
//  ViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class InitialStatusViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var maleButton: UIButton!
    @IBOutlet var femaleButton: UIButton!
    @IBOutlet var dateTexField: UITextField!
    
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var kilogramButton: UIButton!
    @IBOutlet var poundButton: UIButton!
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var meterButton: UIButton!
    @IBOutlet var feetButton: UIButton!
    
    var isEnglishUnitsWeight = false
    var isEnglishUnitsHeight = false
    var genderSelected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.text = "0.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func KilogramButtonSelected(_ sender: UIButton) {
        let isInactiveKilogramButton = kilogramButton.backgroundColor == .white ? true : false
        
        if isInactiveKilogramButton {
            isEnglishUnitsWeight = false
            kilogramButton.backgroundColor = .darkGray
            kilogramButton.setTitleColor(.white, for: .normal)
            poundButton.backgroundColor = .white
            poundButton.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func PoundButtonSelected(_ sender: UIButton) {
        let isInactivePoundButton = poundButton.backgroundColor == .white ? true : false
        
        if isInactivePoundButton {
            isEnglishUnitsWeight = true
            poundButton.backgroundColor = .darkGray
            poundButton.setTitleColor(.white, for: .normal)
            kilogramButton.backgroundColor = .white
            kilogramButton.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func MeterButtonSelected(_ sender: UIButton) {
        let isInactiveMeterButton = meterButton.backgroundColor == .white ? true : false
        
        if isInactiveMeterButton {
            isEnglishUnitsHeight = false
            meterButton.backgroundColor = .darkGray
            meterButton.setTitleColor(.white, for: .normal)
            feetButton.backgroundColor = .white
            feetButton.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func FeetButtonSelected(_ sender: UIButton) {
        let isInactiveFeetButton = feetButton.backgroundColor == .white ? true : false
        
        if isInactiveFeetButton {
            isEnglishUnitsHeight = true
            feetButton.backgroundColor = .darkGray
            feetButton.setTitleColor(.white, for: .normal)
            meterButton.backgroundColor = .white
            meterButton.setTitleColor(.black, for: .normal)
        }
    }
    
    @IBAction func MaleButtonSelected(_ sender: UIButton) {
        let isInactiveMaleButton = maleButton.backgroundColor == .white ? true : false
        
        if isInactiveMaleButton {
            genderSelected = "male"
            maleButton.backgroundColor = .darkGray
            maleButton.setTitleColor(.white, for: .normal)
            femaleButton.backgroundColor = .white
            femaleButton.setTitleColor(.black, for: .normal)
        }
    }
    
    @IBAction func FemaleButtonSelected(_ sender: UIButton) {
        let isInactiveFemaleButton = femaleButton.backgroundColor == .white ? true : false
        
        if isInactiveFemaleButton {
            genderSelected = "female"
            femaleButton.backgroundColor = .darkGray
            femaleButton.setTitleColor(.white, for: .normal)
            maleButton.backgroundColor = .white
            maleButton.setTitleColor(.black, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTargetWeight" {
            
            if isTheDataTemplateFilledIt() {
                let unitWeightSelected = isEnglishUnitsWeight == true ? "pound" : "kilo"
                let unitHeightSelected = isEnglishUnitsHeight == true ? "feet" : "meter"
                _ = UserBusinessController.init(nameUser: nameTextField.text!,
                                                genderUser: genderSelected,
                                                weightUser: Float(weightTextField.text!)!,
                                                unitWeight: unitWeightSelected,
                                                heightUser: Float(heightTextField.text!)!,
                                                unitHeight: unitHeightSelected)
            }
        }

    }
    
    func isTheDataTemplateFilledIt() -> Bool {
        if nameTextField.text == "" || genderSelected == ""
            || weightTextField.text! == "" || Float(weightTextField.text!) == 0.0
            || heightTextField.text! == "" || Float(heightTextField.text!) == 0.0 {
            return false
        }
        
        return true
    }

}

