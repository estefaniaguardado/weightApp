//
//  ViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class InitStatusViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var kilogramButton: UIButton!
    @IBOutlet weak var poundButton: UIButton!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var meterButton: UIButton!
    @IBOutlet weak var feetButton: UIButton!
    
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "goToTargetWeight" {
            if !isTheDataTemplateFilledIt() {
                alertIncompleteInformation()
                return false
            }
        }
        
        return true
    }
    
    func isTheDataTemplateFilledIt() -> Bool {
        if nameTextField.text == "" || genderSelected == ""
            || weightTextField.text! == "" || Float(weightTextField.text!) == 0.0
            || heightTextField.text! == "" || Float(heightTextField.text!) == 0.0 {
            return false
        }
        
        return true
    }
    
    func alertIncompleteInformation() {
        let alertController = UIAlertController(title: "Incomplete Information", message:
            "Complete the empty fields.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToTargetWeight"{
            //TODO : Data persistence #24
            let unitWeightSelected = isEnglishUnitsWeight == true ? "pound" : "kilo"
            let unitHeightSelected = isEnglishUnitsHeight == true ? "feet" : "meter"
            let userBC = UserBusinessController.init(nameUser: nameTextField.text!,
                                            genderUser: genderSelected,
                                            weightUser: Float(weightTextField.text!)!,
                                            unitWeight: unitWeightSelected,
                                            heightUser: Float(heightTextField.text!)!,
                                            unitHeight: unitHeightSelected)
            
            let initTargetVC = segue.destination as! InitTargetViewController
            let targetWeight = userBC.getIdealWeightByLoretz()
            initTargetVC.currentWeight = Float(weightTextField.text!)!
            initTargetVC.targetWeight = targetWeight
            initTargetVC.height = heightTextField.text
            initTargetVC.targetDate = userBC.getTargetDate(idealWeight: targetWeight)
            initTargetVC.unitHeight = unitHeightSelected
            initTargetVC.unitWeight = unitWeightSelected
            initTargetVC.gender = genderSelected
            initTargetVC.name = nameTextField.text!
        }
    }
    
}

