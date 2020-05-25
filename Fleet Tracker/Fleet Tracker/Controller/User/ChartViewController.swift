//
//  ChartViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 24/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit
import Charts
class ChartViewController: UIViewController {
    
    let vehicle = ["456242965", "456242966", "456242967", "456242968", "456242969", "456242910"]
    let distance = [60, 80, 26, 30, 8, 100]
    
    
    
    @IBOutlet weak var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawChart(dataPoints: vehicle, values: distance.map{ Double($0) })
        
    }
    
    
    
    func drawChart(dataPoints: [String], values: [Double]) {
        
        var dataEntriesArray: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntriesArray.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntriesArray, label: nil)
        pieChartDataSet.colors = Colors(numbersOfColor: dataPoints.count)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        pieChartDataSet.drawValuesEnabled = true
        chartView.drawEntryLabelsEnabled = false
        chartView.data = pieChartData
    }
    
    
    private func Colors(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
}
