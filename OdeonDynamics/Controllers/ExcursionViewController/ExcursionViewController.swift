//
//  ExcursionViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 18.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit
import PieCharts


class ExcursionViewController: UIViewController {
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pieChart: PieChart!
    @IBOutlet weak var dataLabel: UILabel!
    
    var excursionVM = ExcursionVM()
    var salesVM = SalesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondView.addLine(position: .bottom, color: .gray, width: 0.5)
        
        self.pieChart.delegate = self
        self.pieChart.layers = [self.createTextLayer()]
        
        let alpha : CGFloat = 0.8
        self.pieChart.models = [
            PieSliceModel(value: Double(self.excursionVM.dataArray[0])!, color: UIColor.red.withAlphaComponent(alpha)),
            PieSliceModel(value: Double(self.excursionVM.dataArray[1])!, color: UIColor.blue.withAlphaComponent(alpha)),
            PieSliceModel(value: Double(self.excursionVM.dataArray[2])!, color: UIColor.green.withAlphaComponent(alpha)),
            PieSliceModel(value:  Double(self.excursionVM.dataArray[3])!, color: UIColor.cyan.withAlphaComponent(alpha)),
            PieSliceModel(value:  Double(self.excursionVM.dataArray[4])!, color: UIColor.yellow.withAlphaComponent(alpha)),
        ]
        
        dataLabel.text = salesVM.dataArray[0]
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ExcursionTableViewCell.nib, forCellReuseIdentifier: ExcursionTableViewCell.identifier)
        
        self.excursionVM.delegate = self
        self.excursionVM.getMainPageList()
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
    
    @IBAction func backButton(_ sender: Any) {
        self.otiPushViewController(viewController: SalesViewController())
    }
}

extension ExcursionViewController : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
        
    }
}

extension ExcursionViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.excursionVM.excursionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExcursionTableViewCell.identifier) as! ExcursionTableViewCell
        cell.setInfo(excursion: excursionVM.excursionList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ExcursionViewController : PieChartDelegate {
    func onSelected(slice: PieSlice, selected: Bool) {
        print("Selected: \(selected), slice: \(slice)")
    }
}
