//
//  ViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class InitStatusViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var weightTextField: VSTextField!
    @IBOutlet weak var kilogramButton: UIButton!
    @IBOutlet weak var poundButton: UIButton!
    @IBOutlet weak var validWeightLabel: UILabel!
    
    @IBOutlet weak var heightTextField: VSTextField!
    @IBOutlet weak var meterButton: UIButton!
    @IBOutlet weak var feetButton: UIButton!
    @IBOutlet weak var validHeightLabel: UILabel!
    
    var isEnglishUnitsWeight = false
    var isEnglishUnitsHeight = false
    var genderSelected = "notSet"
        var userData: User!
    var convertorMeasure: ConvertorMeasure!
    var calculateTargets: CalculateTargets!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.delegate = self
        heightTextField.delegate = self
        weightTextField.setFormatting("###.##", replacementChar: "#")
        heightTextField.setFormatting("#.##", replacementChar: "#")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if userData == nil { userData = User.init() }
        initDataValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func initDataValues() {
        weightTextField.text = userData.userWeight.isZero ? "0" : String(format:"%.2f", userData.userWeight!)
        heightTextField.text = userData.userHeight.isZero ? "0" : String(format:"%.2f", userData.userHeight!)
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case weightTextField:
            validWeightLabel.backgroundColor = .lightGray
            weightTextField.text = ""
        case heightTextField:
            validHeightLabel.backgroundColor = .lightGray
            heightTextField.text = ""
        default:
            return
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(weightTextField) || textField.isEqual(heightTextField) {
            if textField.text == "" && (string == "0") {
                return false
            }
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case weightTextField:
            return isValidWeightTextField()
        case heightTextField:
            return isValidHeightTextField()
        default:
            return true
        }
    }
    
    func isValidWeightTextField () -> Bool {
        let quantityTextField = weightTextField.text.isEmpty ? 0 : Int(weightTextField.text!)!
        let isValidWeight = quantityTextField > 10 ? true : false
        if isValidWeight  {
            validWeightLabel.backgroundColor = .green
            weightTextField.text = String(quantityTextField)
            return true
        } else {
            validWeightLabel.backgroundColor = .red
            weightTextField.text = ""
            return false
        }
    }
    
    func isValidHeightTextField () -> Bool {
        var quantityTextField = heightTextField.text.isEmpty ? 0 : Int(heightTextField.text!)!
        let isValidHeight = quantityTextField > 1 ? true : false
        if isValidHeight  {
            quantityTextField = quantityTextField < 100 ? quantityTextField * 10 : quantityTextField
            validHeightLabel.backgroundColor = .green
            heightTextField.text = String(quantityTextField)
            return true
        } else {
            validHeightLabel.backgroundColor = .red
            heightTextField.text = ""
            return false
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
        if nameTextField.text! == "" || genderSelected == ""
            || weightTextField.text! == "" || Int(weightTextField.text!)! < 10
            || heightTextField.text! == "" || Int(heightTextField.text!)! < 1 {
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
            let height = getHeight()
            let targetWeight = calculateTargets.getTargetWeight(gender: genderSelected,
                                                                height: height)
            
            let initTargetVC = segue.destination as! InitTargetViewController
            initTargetVC.height = height
            initTargetVC.targetWeight = targetWeight
            initTargetVC.targetDate = calculateTargets.getTargetDate(currentDate: Date(), kilos: targetWeight)
            initTargetVC.unitHeight = isEnglishUnitsHeight == true ? "feet" : "meter"
            initTargetVC.unitWeight = isEnglishUnitsWeight == true ? "pound" : "kilo"
            initTargetVC.gender = genderSelected
            initTargetVC.name = nameTextField.text!
        }
    }
    
    func getCurrentWeight () -> Int {
        return Int(weightTextField.text!)! * 100
    }
    
    func getHeight() -> Int {
        if !isEnglishUnitsHeight {
            let height = Int(heightTextField.text!)! < 100 ?
                Int(heightTextField.text!)! * 10 : Int(heightTextField.text!)!
            return height
        }
        let feets = Float(heightTextField.text!)! / 100
        return convertorMeasure.feetToCentimeters(quantity: feets)
    }
    
}

