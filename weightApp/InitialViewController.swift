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
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var meterButton: UIButton!
    @IBOutlet var feetButton: UIButton!
    
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
        
        meterButton.setTitle("Meters", for: .normal)
        meterButton.setTitle("Feet", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    @IBAction func meterButtonSelected(_ sender: UIButton) {
        let isInactiveMeterButton = meterButton.backgroundColor == .white ? true : false
        
        if isInactiveMeterButton {
            meterButton.backgroundColor = .darkGray
            meterButton.setTitleColor(.white, for: .normal)
            feetButton.backgroundColor = .white
            feetButton.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func feetButtonSelected(_ sender: UIButton) {
        let isInactiveFeetButton = feetButton.backgroundColor == .white ? true : false
        
        if isInactiveFeetButton {
            feetButton.backgroundColor = .darkGray
            feetButton.setTitleColor(.white, for: .normal)
            meterButton.backgroundColor = .white
            meterButton.setTitleColor(.black, for: .normal)
        }
    }

}

