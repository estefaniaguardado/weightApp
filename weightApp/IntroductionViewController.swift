//
//  IntroductionViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 01.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    var healthKit: HealthKitService!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func AccessToHealthKit(_ sender: UIButton) {
        
        healthKit.accessHealthKit()?.then { result in
            self.presentInitStatusVC(initialData: result)
        }.catch { error in
            print(error)
        }
    }
    
    func presentInitStatusVC(initialData: User) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "initStatusVC") as! InitStatusViewController
        secondViewController.hideBackButton = true
        //TODO: secondViewController.userData = User.init()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
