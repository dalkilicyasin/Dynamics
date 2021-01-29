//
//  SalesViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 16.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit
import PieCharts
import Charts

class SalesViewController: UIViewController {
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var pieChart: PieChart!
    @IBOutlet weak var tableView: UITableView!
    
    var salesVM = SalesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondView.addLine(position: .bottom, color: .gray, width: 0.5)
        
        self.pieChart.delegate = self
        self.pieChart.layers = [self.createTextLayer()]
        let alpha : CGFloat = 0.8
        self.pieChart.models = [
            PieSliceModel(value: Double(self.salesVM.dataArray[0])!, color: UIColor.red.withAlphaComponent(alpha)),
            PieSliceModel(value: Double(self.salesVM.dataArray[1])!, color: UIColor.blue.withAlphaComponent(alpha)),
            PieSliceModel(value: Double(self.salesVM.dataArray[2])!, color: UIColor.green.withAlphaComponent(alpha)),
            /*  PieSliceModel(value:  Double(self.degerArray[3]), color: UIColor.cyan.withAlphaComponent(alpha)),
             PieSliceModel(value:  Double(self.degerArray[4]), color: UIColor.red.withAlphaComponent(alpha)),*/
        ]
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(SalesTableViewCell.nib, forCellReuseIdentifier: SalesTableViewCell.identifier)
        
        self.salesVM.delegate = self
        self.salesVM.getMainPageList()
    }
    
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 60
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
}

extension SalesViewController : ViewModelDelegate {
    
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
    }
}

extension SalesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.salesVM.salesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SalesTableViewCell.identifier) as! SalesTableViewCell
        cell.setInfo(sales: salesVM.salesList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.otiPushViewController(viewController: ExcursionViewController())
    }
}

extension SalesViewController : PieChartDelegate {
    func onSelected(slice: PieSlice, selected: Bool) {
        print("Selected: \(selected), slice: \(slice)")
    }
}
