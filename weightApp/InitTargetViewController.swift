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
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
