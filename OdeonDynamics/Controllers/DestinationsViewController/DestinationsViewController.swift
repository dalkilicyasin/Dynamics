//
//  DestinationsViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 15.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var destinationView: DestinationSelectView!
    @IBOutlet weak var typeListSelectView: TypeListSelectView!
    
    var destinationVM = DestinationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeListSelectView.backgroundColor = .clear
        
        destinationView.layer.cornerRadius = 5
        destinationView.layer.shadowColor = UIColor.black.cgColor
        destinationView.layer.shadowOpacity = 0.3
        destinationView.layer.shadowOffset = .zero
        destinationView.layer.shadowRadius = 5
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DestinationTableViewCell.nib, forCellReuseIdentifier: DestinationTableViewCell.identifier)
        
        self.destinationVM.delegate = self
        self.destinationVM.getMainPageList()   
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
