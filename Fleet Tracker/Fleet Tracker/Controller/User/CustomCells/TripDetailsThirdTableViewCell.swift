//
//  TripDetailsThirdTableViewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 05/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit
import Charts
class TripDetailsThirdTableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    
    
    @IBOutlet weak var speedTextlabel: UILabel!
    
    
    var speedLimit:Int?
    
    var dateTime:[String] = []
    var speed:[Int] = []
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.speedTextlabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            self.axisFormatDelegate = self
            if self.dateTime.count != 0 && self.speed.count != 0
            {
                self.drawChart(dataPoints:self.dateTime, values: self.speed.map{ Double($0)})
            }
            
        }
    }
    
    
    func drawChart(dataPoints: [String], values: [Double]) {
        lineChartView.clear()
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
            
            let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Speed (mph)")
            lineChartDataSet.colors = [UIColor(named: "GraphCircleColor")!]
            lineChartDataSet.setCircleColor(UIColor(named: "GraphCircleColor")!)
            lineChartDataSet.mode = .cubicBezier
            lineChartDataSet.circleHoleColor = UIColor.white
            lineChartDataSet.circleRadius = 6.0
            lineChartDataSet.lineWidth = 2
            
            let chartData = LineChartData()
            chartData.addDataSet(lineChartDataSet)
            chartData.setDrawValues(false)
            lineChartView.data = chartData
            lineChartView.rightAxis.enabled = false
            lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
            let limitLine = ChartLimitLine(limit: Double(speedLimit!), label: "")
            lineChartView.leftAxis.addLimitLine(limitLine)
            lineChartView.xAxis.drawGridLinesEnabled = false
            let speedLegend = LegendEntry.init(label: "Speed (mph)", form: .default, formSize: CGFloat.nan, formLineWidth: CGFloat.nan, formLineDashPhase: CGFloat.nan, formLineDashLengths: nil, formColor: UIColor(named:"GraphCircleColor" ))
            let limitLegend = LegendEntry.init(label: "Speed Limit", form: .default, formSize: CGFloat.nan, formLineWidth: CGFloat.nan, formLineDashPhase: CGFloat.nan, formLineDashLengths: nil, formColor:UIColor.red )
            lineChartView.legend.setCustom(entries:[speedLegend, limitLegend])
            
            let xAxisValue = lineChartView.xAxis
            xAxisValue.valueFormatter = axisFormatDelegate
        }
    }
    
}

extension TripDetailsThirdTableViewCell: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dateTime[Int(value)]
    }
}
