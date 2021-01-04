//
//  ModuleViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class ModuleViewController: UIViewController {
    
    @IBOutlet weak var headerView: OdeonHeaderView!
 
    @IBOutlet weak var tableView: UITableView!
    
    let moduleVM = ModuleVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ModuleTableViewCell.nib, forCellReuseIdentifier: ModuleTableViewCell.identifier)
        
        self.moduleVM.delegate = self
        self.moduleVM.getModuleList()
    }
}

extension ModuleViewController : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
    }
}

extension ModuleViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moduleVM.moduleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModuleTableViewCell.identifier) as! ModuleTableViewCell
        cell.setInfo(module: self.moduleVM.moduleList[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.otiPushViewController(viewController: MainPageViewController())
    }
}
