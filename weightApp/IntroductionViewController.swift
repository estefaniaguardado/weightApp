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
        healthKit.authorizationHealthKit { (success, error) in
            self.presentInitialNavigationVC()
        }
    }
    
    func presentInitialNavigationVC() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let initialNavigationVC = storyboard.instantiateViewController(withIdentifier: "navigationInitial")
        self.present(initialNavigationVC, animated: true, completion: nil)
    }

}
