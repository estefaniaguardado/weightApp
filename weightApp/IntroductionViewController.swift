//
//  IntroductionViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 01.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func AccessToHealthKit(_ sender: UIButton) {
        
        let healthKit = HealthKitService()
        healthKit.accessHealthKit()?.then { result in
            self.presentInitStatusVC()
        }.catch { error in
            print(error)
        }
    }
    
    func presentInitStatusVC() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "initStatusVC") as! InitStatusViewController
        secondViewController.setValue(true, forKey: "hideBackButton")
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
