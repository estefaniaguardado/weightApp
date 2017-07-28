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
    
    var weightTarget: Float!
    var height: String!
    var targetDate: Date!

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weightTextField.text = String(weightTarget)
        heightTextField.text = height
        dateTextField.text = formatDate(date: targetDate)
        
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
        if weightTextField.text != "" {
            weightTextField.text = String(weightTarget)
            self.view.endEditing(true)
            return
        }
        
        if weightTextField.text != String(weightTarget) {
            print(weightTextField.text!)
        }
        
        self.view.endEditing(true)
    }

}
