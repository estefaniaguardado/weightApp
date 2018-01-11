//
//  GraphWeightStatsViewController.swift
//  weightApp
//
//  Created by Estefania Guardado on 08.01.18.
//  Copyright © 2018 Estefania Guardado. All rights reserved.
//

import UIKit
import PNChart

class GraphWeightStatsViewController: UIViewController {
    
    override func viewDidLoad() {
        let lineChart = self.setLineChart()
        lineChart.center = CGPoint(x: self.view.center.y, y: self.view.center.x)
        lineChart.backgroundColor = .white
        self.view.addSubview(lineChart)
    }
    
    private func setLineChart() -> PNLineChart {
        let lineChart = PNLineChart(frame: CGRect(x: 0, y: 135, width: UIScreen.main.bounds.width - 25, height: 250))
        lineChart.yLabelFormat = "%1.1f"
        lineChart.showLabel = true
        lineChart.backgroundColor = UIColor.clear
        lineChart.xLabels = ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"]
        lineChart.isShowCoordinateAxis = true
        lineChart.center = self.view.center
        
        let dataArr = [60.1, 160.1, 126.4, 232.2, 186.2, 127.2, 176.2]
        let data = PNLineChartData()
        data.color = .green
        data.itemCount = UInt(dataArr.count)
        data.inflexionPointStyle = .none
        data.getData = ({
            (index) -> PNLineChartDataItem in
            let idx = Int(index)
            let yValue = CGFloat(dataArr[idx])
            return PNLineChartDataItem(y: yValue)
        })
        
        lineChart.chartData = [data]
        lineChart.stroke()
        return lineChart
    }
    
}
