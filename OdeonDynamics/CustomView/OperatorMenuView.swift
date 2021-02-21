//
//  OperatorMenuView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class OperatorMenuView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewOperatorMenu: UIView!
    @IBOutlet weak var buttonSelect: UIButton!
    
    var operatorModuleList = OperatorMenuVM()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: OperatorMenuView.self), owner: self, options: nil)
        viewOperatorMenu.addCustomContainerView(self)
        
        buttonSelect.layer.cornerRadius = 7
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        self.operatorModuleList.delegate = self
        self.operatorModuleList.getMainPageList()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(OperatorMenuTableViewCell.nib, forCellReuseIdentifier: OperatorMenuTableViewCell.identifier)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.removeFromSuperview()
    }
    
}

extension OperatorMenuView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.operatorModuleList.infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OperatorMenuTableViewCell.identifier) as! OperatorMenuTableViewCell
        
        if operatorModuleList.operatorList.count > 0 {
            cell.setInfo(operatormenu: operatorModuleList.operatorList[indexPath.row])
        }else{
            self.tableView.reloadData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }  
}

extension OperatorMenuView : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
        
    }
}
