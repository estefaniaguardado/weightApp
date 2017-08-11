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
    var genderSelected = "notSet"
    var hideBackButton = false
    var userData: User!
    var convertorMeasure = ConvertorMeasure()
    var calculateTargets = CalculateTargets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = hideBackButton
        
        if userData == nil { userData = User.init() }
        
        initDataValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initDataValues() {
        weightTextField.text = String(format:"%.2f", userData.userWeight!)
        heightTextField.text = String(format:"%.2f", userData.userHeight!)
        genderSelected = userData.userBiologicalSex!
        
        switch genderSelected {
            case "female":
                femaleButton.backgroundColor = .darkGray
                femaleButton.setTitleColor(.white, for: .normal)
            case "male":
                maleButton.backgroundColor = .darkGray
                maleButton.setTitleColor(.white, for: .normal)
            default:
                return
        }
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
            
            let initTargetVC = segue.destination as! InitTargetViewController
            initTargetVC.currentWeight = weightTextField.text!
            initTargetVC.height = heightTextField.text
            let height = getHeight()
            let targetWeight = calculateTargets.getTargetWeight(gender: genderSelected,
                                                                height: height)
            initTargetVC.targetWeight = String(targetWeight)
            initTargetVC.targetDate = calculateTargets.getTargetDate(currentDate: Date(), kilos: targetWeight)
            initTargetVC.unitHeight = isEnglishUnitsHeight == true ? "feet" : "meter"
            initTargetVC.unitWeight = isEnglishUnitsWeight == true ? "pound" : "kilo"
            initTargetVC.gender = genderSelected
            initTargetVC.name = nameTextField.text!
        }
    }
    
    func getCurrentWeight() -> Int {
        
        if isEnglishUnitsWeight {
            let grams = convertorMeasure.poundsToGrams(quantity: Float(weightTextField.text!)!)
            return convertorMeasure.gramsToKilos(quantity: Float(grams))
        }
        
        return Int(weightTextField.text!)!
    }
    
    func getHeight() -> Int {

        if isEnglishUnitsHeight {
            return convertorMeasure.feetToCentimeters(quantity: Float(heightTextField.text!)!)
        }
        
        return convertorMeasure.metersToCentimeters(quantity: Float(heightTextField.text!)!)
    }
    
}

