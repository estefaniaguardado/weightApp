//
//  ViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var kilogramLabel: UILabel!
    @IBOutlet var poundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.text = "0.00"
        
        kilogramLabel.text = "Kilos"
        kilogramLabel.isUserInteractionEnabled = true
        kilogramLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(isTappedKilogramLabel)))
        
        poundLabel.text = "Pounds"
        poundLabel.isUserInteractionEnabled = true
        poundLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(isTappedPoundLabel)))
    }
    
    func isTappedKilogramLabel(sender:UITapGestureRecognizer) {
        print("Kilogram")
    }
    
    func isTappedPoundLabel(sender:UITapGestureRecognizer) {
        print("Pound")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

