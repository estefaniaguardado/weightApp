//
//  circleCurrentWeightView.swift
//  weightApp
//
//  Created by Estefania Guardado on 05.01.18.
//  Copyright © 2018 Estefania Guardado. All rights reserved.
//
//  Reference circleLayerAnimated: https://stackoverflow.com/a/26578895

import UIKit
import GLKit

class CircleCurrentWeightView: UIView {
    
    var circleLayer: CAShapeLayer!

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(GLKMathDegreesToRadians(-90)), endAngle: CGFloat((.pi * 3.0)/2.0), clockwise: true)
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 15.0;
        circleLayer.strokeEnd = 0.0
        
        layer.addSublayer(circleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateCircle(duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        circleLayer.strokeEnd = 0.5
        circleLayer.add(animation, forKey: "animateCircle")
    }
}
