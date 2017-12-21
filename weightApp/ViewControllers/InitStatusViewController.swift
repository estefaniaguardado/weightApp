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
    
    @IBOutlet weak var weightStepper: UIStepper!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var kilogramButton: UIButton!
    @IBOutlet weak var poundButton: UIButton!
    
    @IBOutlet weak var heightStepper: UIStepper!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var meterButton: UIButton!
    @IBOutlet weak var feetButton: UIButton!
    
    var isEnglishUnitsWeight = false
    var hasWeightValueDecimals = false
    var isEnglishUnitsHeight = false
    var genderSelected = "notSet"
        var userData: User!
    var convertorMeasure: ConvertorMeasure!
    var calculateTargets: CalculateTargets!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightLabel.text = "25"
        weightStepper.minimumValue = 25
        weightStepper.stepValue = 0.5
        heightLabel.text = "1.00"
        heightStepper.minimumValue = 1
        heightStepper.stepValue = 0.01
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
        if !userData.userWeight.isZero {
            weightLabel.text = String(format:"%.2f", userData.userWeight!)
            weightStepper.value = userData.userWeight!
        }
        if !userData.userHeight.isZero {
            heightLabel.text = String(format:"%.2f", userData.userHeight!)
            heightStepper.value = userData.userHeight!
        }
                
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
    
    @IBAction func weightStepperAction(_ sender: Any) {
        hasWeightValueDecimals = hasWeightValueDecimals == false ? true : false
        weightLabel.text = "\(Double(weightStepper.value))"
    }
    
    @IBAction func heightStepperAction(_ sender: Any) {
        heightLabel.text = "\(Double(heightStepper.value))"
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
            let isTheDataTemplateFilledIt = nameTextField.text! == "" || genderSelected == "" ? false : true
            if !isTheDataTemplateFilledIt {
                alertIncompleteInformation()
                return false
            }
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
            let targetWeight = calculateTargets.getTargetWeight(gender: genderSelected,
                                                                height: getHeight())
            
            let initTargetVC = segue.destination as! InitTargetViewController
            initTargetVC.height = Double(heightStepper.value)
            initTargetVC.targetWeight = targetWeight
            initTargetVC.targetDate = calculateTargets.getTargetDate(currentDate: Date(), kilos: targetWeight)
            initTargetVC.unitHeight = isEnglishUnitsHeight == true ? "feet" : "meter"
            initTargetVC.unitWeight = isEnglishUnitsWeight == true ? "pound" : "kilo"
            initTargetVC.gender = genderSelected
            initTargetVC.name = nameTextField.text!
        }
    }

    //TODO: exist decimals in weight number
    //func getCurrentWeight () {}
    
    func getHeight() -> Int {
        let height = Double(heightStepper.value) < 10 ? Double(heightStepper.value) * 100 : Double(heightStepper.value)
        if isEnglishUnitsHeight {
            return convertorMeasure.feetToCentimeters(quantity: Double(heightStepper.value))
        }
        return Int(height)
    }
    
}

