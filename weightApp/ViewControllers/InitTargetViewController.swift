//
//  InitTargetViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 20.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit
import DatePickerDialog

class InitTargetViewController: UIViewController {
    
    //TODO: Data Persistence #24
    var currentWeight: Double!
    var targetWeight: Int!
    var height: Double!
    var targetDate: Date!
    var unitWeight: String!
    var unitHeight: String!
    var gender: String!
    var name: String!
    @objc var calculateTargets: CalculateTargets!

    @IBOutlet weak var targetWeightLabel: UILabel!
    @IBOutlet weak var targetHeightLabel: UILabel!
    @IBOutlet weak var weightStepper: UIStepper!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unitWeightLabel: UILabel!
    @IBOutlet weak var unitHeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetWeightLabel.text = String(targetWeight)
        targetHeightLabel.text = String(height)
        weightStepper.minimumValue = Double(targetWeight)
        weightStepper.stepValue = 1
        weightStepper.maximumValue = Double(targetWeight + 40)
        dateLabel.text = formatDate(date: targetDate)
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
        
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", minimumDate: Date(), datePickerMode: .date) {
            (date) -> Void in
            if (date != nil) {
                self.dateLabel.text = self.formatDate(date: date!)
            }
        }
    }
    
    func formatDate(date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "dd-MMMM-yyyy"
        return format.string(from: date)
    }
    
    @IBAction func weightStepperAction(_ sender: Any) {
        targetWeightLabel.text = "\(Double(weightStepper.value))"
        let newTargetWeight = Int(currentWeight - weightStepper.value)
        dateLabel.text = formatDate(date: calculateTargets.getTargetDate(currentDate: Date(), kilos: newTargetWeight))
    }
      
}
