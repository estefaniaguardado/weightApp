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
    
    var isTappedKgLabel = true
    var isTappedPoundLabel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.text = "0.00"
        
        kilogramLabel.text = "Kilos"
        kilogramLabel.isUserInteractionEnabled = true
        kilogramLabel.backgroundColor = .darkGray
        kilogramLabel.textColor = .white
        kilogramLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapKilogramLabel)))
        
        poundLabel.text = "Pounds"
        poundLabel.isUserInteractionEnabled = true
        poundLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapPoundLabel)))
    }
    
    func tapKilogramLabel(sender:UITapGestureRecognizer) {
        if isTappedKgLabel == false {
            isTappedKgLabel = true
        }

        if isTappedKgLabel {
            isTappedPoundLabel = false
            kilogramLabel.backgroundColor = .darkGray
            kilogramLabel.textColor = .white
            poundLabel.backgroundColor = .white
            poundLabel.textColor = .black
            
        } else {
            isTappedPoundLabel = true
            kilogramLabel.backgroundColor = .white
            kilogramLabel.textColor = .black
            poundLabel.backgroundColor = .darkGray
            poundLabel.textColor = .white
        }
    }
    
    func tapPoundLabel(sender:UITapGestureRecognizer) {
        if isTappedPoundLabel == false {
            isTappedPoundLabel = true
        }
        
        if isTappedPoundLabel {
            isTappedKgLabel = false
            poundLabel.backgroundColor = .darkGray
            poundLabel.textColor = .white
            kilogramLabel.backgroundColor = .white
            kilogramLabel.textColor = .black
            
        } else {
            isTappedKgLabel = true
            poundLabel.backgroundColor = .white
            poundLabel.textColor = .black
            kilogramLabel.backgroundColor = .darkGray
            kilogramLabel.textColor = .white
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

