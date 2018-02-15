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
    @objc var graphWeightStatsViewController: GraphWeightStatsViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PerformIfIsFirstLaunch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func PerformIfIsFirstLaunch() {
        let firstLaunch = UserDefaults.standard.bool(forKey: "hasBeenLaunchedBefore")
        
        if firstLaunch {
            addCircleView()
            return
        } else {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            presentIntroductionVC()
        }
    }
    
    func presentIntroductionVC() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let introductionVC = storyboard.instantiateViewController(withIdentifier: "navigationInitial")
        self.present(introductionVC, animated: true, completion: nil)
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
        let isLandscapeMode = UIDevice.current.orientation.isLandscape &&
            !(self.navigationController?.visibleViewController?.isEqual(graphWeightStatsViewController))!
        let isPortraitMode = UIDevice.current.orientation.isPortrait
        
        if isLandscapeMode {
            self.navigationController?.pushViewController(graphWeightStatsViewController, animated: false)
        } else if isPortraitMode {
            self.navigationController?.popViewController(animated: false)
        }
    }
}
