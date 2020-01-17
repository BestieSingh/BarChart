//
//  ViewController.swift
//  BarChart
//
//  Created by ksolves on 14/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    var chartsViewModel = ChartsViewModel()
    
    var counter = [Double] ()
    var values = [Double] ()
    var labels = [String] ()
    var colors = [UIColor] ()
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCharts()
        //setChartData()
    }
    
    func getCharts() {
        print("In getCharts")
        ChartsManager.shared.getCharts(completion: {(alert, error) in
            if error == nil {
                print("Data saved in model")
                self.chartsViewModel.chartsModel = alert!
                self.chartsViewModel.count = (alert?.result?.dashboardData?.channels!.count)!
                self.chartsViewModel.values = (alert?.result?.dashboardData?.revenue)!
                self.chartsViewModel.labels = (alert?.result?.dashboardData?.channels)!
                self.setChartData()
                
            }else {
                let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {(action) -> Void in
                    alert.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    func setChartData(){
        print("In setChartData")
        var dataEntries : [BarChartDataEntry] = []
        
        count = chartsViewModel.values.count
        for i in 0..<count {
            counter.append(Double(i))
        }
        labels = chartsViewModel.labels
        values = chartsViewModel.values
        colors = chartsViewModel.getBgColors()
        print("Count: \(count)\n Counter: \(counter)\n Values: \(values) \n Labels: \(labels) \n Colors: \(colors)")
        
//        counter = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0]
//        values = [78000.0, 47000.0, 22000.0, 8600.0, 1500.0, 1500.0]
//        labels = ["Gross\nSales", "Online\nTicket\nSales", "Ambassador\nTicket\nSales", "Ambassador\nMerchant\nSales", "Transfer\nFund", "Refunds"]
    
        for i in 0..<count{
            let dataEntry = BarChartDataEntry(x: counter[i], y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet =  BarChartDataSet(entries: dataEntries,label: "")
        let chartData = BarChartData()
        
        let rightYAxis = barChartView.getAxis(.right)
        rightYAxis.drawLabelsEnabled = false
        rightYAxis.drawGridLinesEnabled = false
        rightYAxis.drawZeroLineEnabled = false
        rightYAxis.drawAxisLineEnabled = false
        
        
        let leftYAxis = barChartView.getAxis(.left)
        leftYAxis.drawGridLinesEnabled = false
        leftYAxis.drawAxisLineEnabled = false
        let numberFormatter = NumberFormatter()
        numberFormatter.positivePrefix = " $"
        leftYAxis.valueFormatter = DefaultAxisValueFormatter(formatter: numberFormatter)
        leftYAxis.drawBottomYLabelEntryEnabled = false
    
        
        let xAxis = barChartView.xAxis
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        xAxis.valueFormatter =  IndexAxisValueFormatter(values: labels)
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 9)
        //xAxis.granularity = 1
        xAxis.labelCount = count
        xAxis.labelWidth = CGFloat(chartData.barWidth)
        xAxis.centerAxisLabelsEnabled = false

        
        chartData.barWidth = 0.97
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(true)
        chartDataSet.colors = colors
        chartDataSet.valueFormatter = ValueFormatter()
        
        print("Is y-value drawing enabled: \(chartDataSet.isDrawValuesEnabled)")
        print("Is stacked: \(chartDataSet.isStacked)")
        print("Is inverted: \(barChartView.isInverted(axis: .left))")

        
        barChartView.drawGridBackgroundEnabled = false
        barChartView.drawValueAboveBarEnabled = false
        barChartView.clipValuesToContentEnabled = true
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.data = chartData
//      barChartView.renderer = CustomRenderer(dataProvider:barChartView.self, animator: Animator(), viewPortHandler: barChartView.viewPortHandler)
        
    }

}

final class ValueFormatter: IValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return "$\(value)"
    }
}

