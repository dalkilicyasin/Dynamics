//
//  NavigationBarView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 7.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit


class NavigationBarView: UIView {
    
    @IBOutlet weak var headerView: HamburgerMenuView!
    @IBOutlet var navigationBarView: UIView!
    @IBOutlet weak var secondNavigationBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var barModuleList = ModuleVM()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: NavigationBarView.self), owner: self, options: nil)
        navigationBarView.addCustomContainerView(self)
        
        secondNavigationBarView.layer.cornerRadius = 7
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ModuleTableViewCell.nib, forCellReuseIdentifier: ModuleTableViewCell.identifier)
        
        self.barModuleList.delegate = self
        self.barModuleList.getModuleList()
        
        tableView.estimatedRowHeight = 102
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension NavigationBarView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.barModuleList.moduleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModuleTableViewCell.identifier) as! ModuleTableViewCell
        cell.setInfo(module: barModuleList.moduleList[indexPath.row])
        return cell
    }
}

extension NavigationBarView : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
    }
}
