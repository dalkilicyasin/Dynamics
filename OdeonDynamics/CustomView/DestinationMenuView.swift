//
//  DestinationMenuView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 29.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationMenuView: UIView {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var destinationMenuView: UIView!
    @IBOutlet weak var secondView: UIView!
    let destinationList = ["Odeon Tour EG","Odeon Tour GR","Odeon Tour ES","Odeon Tour UAE","Odeon Tour TN","Odeon Tour TZ","Odeon Tour TH"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: DestinationMenuView.self), owner: self, options: nil)
        destinationMenuView.addCustomContainerView(self)
        
        secondView.layer.cornerRadius = 7
        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DestinationMenuTableViewCell.nib, forCellReuseIdentifier: DestinationMenuTableViewCell.identifier)
        
    }
    
}

extension DestinationMenuView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.destinationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DestinationMenuTableViewCell.identifier) as! DestinationMenuTableViewCell
        cell.infoLAbel.text = destinationList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
