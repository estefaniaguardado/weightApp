//
//  StatusViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 25.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    var circleLayer: CAShapeLayer!
    @IBOutlet weak var startWeightLabel: UILabel!
    @IBOutlet weak var startBmiLabel: UILabel!
    @IBOutlet weak var startDateWeightLabel: UILabel!
    @IBOutlet weak var targetWeightLabel: UILabel!
    @IBOutlet weak var targetBmiLabel: UILabel!
    @IBOutlet weak var targetDateLabel: UILabel!
    @IBOutlet weak var lostWeightLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var currentBmiLabel: UILabel!
    @IBOutlet weak var nameBmiLabel: UILabel!
    @IBOutlet weak var avgDailyLossLabel: UILabel!
    @IBOutlet weak var avgDailyGoalLabel: UILabel!
    @IBOutlet weak var avgWeeklyLossLabel: UILabel!
    @IBOutlet weak var currentWeightView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCircleView()
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
            presentInitialNavigationVC()
        }
    }
    
    func presentInitialNavigationVC() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let initialNavigationVC = storyboard.instantiateViewController(withIdentifier: "navigationInitial")
        self.present(initialNavigationVC, animated: true, completion: nil)
    }
    
    func addCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = currentWeightView.bounds.width
        let circleHeight = currentWeightView.bounds.height
        let circleView = CircleCurrentWeightView(frame: CGRect.init(x: diceRoll, y: 0.0,
                                                                    width: circleWidth, height: circleHeight))
        circleView.center = CGPoint(x: currentWeightView.bounds.midX, y: currentWeightView.bounds.midY)
        currentWeightView.addSubview(circleView)
        circleView.animateCircle(duration: 1.0)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let testView = UIViewController.init()
        let currentOrientation = UIDevice.current.orientation
        let currentViewController = self.navigationController?.visibleViewController
        let isLandscapeMode = UIDeviceOrientationIsLandscape(currentOrientation) && !(currentViewController?.isEqual(testView))!
        
        if isLandscapeMode {
            self.navigationController?.pushViewController(testView, animated: false)
        } else{
            self.navigationController?.popViewController(animated: false)
        }
    }
}
