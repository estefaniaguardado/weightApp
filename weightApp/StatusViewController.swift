//
//  StatusViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 25.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PerformIfIsFirstLaunch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func PerformIfIsFirstLaunch() {
        let firstLaunch = UserDefaults.standard.bool(forKey: "hasBeenLaunchedBefore")
        
        if firstLaunch {
            return
            
        } else {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            presentIntroductionVC()
        }
    }
    
    func presentIntroductionVC() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let introductionVC = storyboard.instantiateViewController(withIdentifier: "IntroductionVC")
        self.present(introductionVC, animated: true, completion: nil)
    }

}
