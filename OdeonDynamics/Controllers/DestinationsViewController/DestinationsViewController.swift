//
//  DestinationsViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 15.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var operatorSelectedView: OperatorSelectView!
    
    var destination2VM = Destination2VM()
    var destinationVM = DestinationVM()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorSelectedView.backgroundColor = .clear
        
        headerView.layer.cornerRadius = 5
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOpacity = 0.3
        headerView.layer.shadowOffset = .zero
        headerView.layer.shadowRadius = 5
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DestinationTableViewCell.nib, forCellReuseIdentifier: DestinationTableViewCell.identifier)
        self.tableView.register(Destination2TableViewCell.nib, forCellReuseIdentifier: Destination2TableViewCell.identifier)
        
        self.destinationVM.delegate = self
        self.destinationVM.getMainPageList()
        
        self.destination2VM.delegate = self
        self.destination2VM.getMainPageList()
        
     
    }
}

extension DestinationsViewController : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
        
    }
}

extension DestinationsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.destinationVM.destinationsList.count
        //return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DestinationTableViewCell.identifier) as! DestinationTableViewCell
        cell.setInfo(destination: self.destinationVM.destinationsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
