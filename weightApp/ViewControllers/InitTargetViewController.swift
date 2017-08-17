//
//  InitTargetViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 20.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit
import DatePickerDialog

class InitTargetViewController: UIViewController, UITextFieldDelegate {
    
    //TODO: Data Persistence #24
    var targetWeight: Int!
    var height: Int!
    var targetDate: Date!
    var unitWeight: String!
    var unitHeight: String!
    var gender: String!
    var name: String!
    var calculateTargets: CalculateTargets!

    @IBOutlet weak var weightTextField: VSTextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var unitWeightLabel: UILabel!
    @IBOutlet weak var unitHeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.setFormatting("###.##", replacementChar: "#")
        weightTextField.text = String(targetWeight)
        heightTextField.text = String(Float(height) / 100.00)
        dateTextField.text = formatDate(date: targetDate)
        unitWeightLabel.text = unitWeight
        unitHeightLabel.text = unitHeight
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneInputTargetData(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func editTargetDate(_ sender: UIButton) {
        
        DatePickerDialog().show(title: "DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", minimumDate: Date(), datePickerMode: .date) {
            (date) -> Void in
            if (date != nil) {
                self.dateTextField.text = self.formatDate(date: date!)
            }
        }
    }
    
    func formatDate(date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "dd-MMMM-yyyy"
        
        return format.string(from: date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if weightTextField.text == "" {
            weightTextField.text = String(targetWeight)
            self.view.endEditing(true)
            return
        }
        
        if weightTextField.text != String(targetWeight) {
            updateTargetWeightAndDate()
        }
        
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(weightTextField) {
            weightTextField.text = ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(weightTextField) {
            if textField.text == "" && (string == "0") {
                return false
            }
        }
        return true
    }
    
    func updateTargetWeightAndDate() {
        let newTargetWeight = weightTextField.text.isEmpty ? 0 : Int(weightTextField.text!)!
        let isValidWeight = newTargetWeight > 10 && targetWeight < newTargetWeight ? true : false
        if isValidWeight  {
            weightTextField.text = String(newTargetWeight)
            dateTextField.text = formatDate(date: calculateTargets.getTargetDate(currentDate: Date(), kilos: Int(newTargetWeight)))
            return
        } else {
            alertIsLessWeightThanIdealWeight()
            weightTextField.text = String(targetWeight)
            return
        }
    }
    
    func alertIsLessWeightThanIdealWeight() {
        let alertController = UIAlertController(title: "Dangerous Target",
                                                message:
            "The inputted target weight is less than ideal weight suggested regarding with your specific measure of height and gender.",
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
