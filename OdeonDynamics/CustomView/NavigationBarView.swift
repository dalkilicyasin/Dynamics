//
//  NavigationBarView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 7.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {
    
    @IBOutlet weak var imageHamburger: UIImageView!
    @IBOutlet weak var viewLogOut: UIView!
    @IBOutlet weak var viewSecondNavigationBar: UIView!
    @IBOutlet var viewNavigationBar: UIView!
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
        viewNavigationBar.addCustomContainerView(self)
        viewLogOut.addLine(position: .bottom, color: .gray, width: 0.5)
        viewLogOut.addLine(position: .top, color: .gray, width: 0.5)
        
        viewSecondNavigationBar.layer.cornerRadius = 7
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ModuleTableViewCell.nib, forCellReuseIdentifier: ModuleTableViewCell.identifier)
        
        self.barModuleList.delegate = self
        self.barModuleList.getModuleList()
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        let logOutTap = UITapGestureRecognizer(target: self, action: #selector(self.logOutHandleTap(_:)))
        viewLogOut.addGestureRecognizer(logOutTap)
        viewLogOut.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imageHamburger.addGestureRecognizer(tap)
        imageHamburger.isUserInteractionEnabled = true
    }
    
    @objc func logOutHandleTap(_ sender: UITapGestureRecognizer) {
        
        print("button tapped")
        if let topVC = UIApplication.getTopViewController() {
            
            let viewController: UIViewController = LoginViewController()
            topVC.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.removeFromSuperview()
        print("button tapped")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected")
        if let topVC = UIApplication.getTopViewController() {
            
            var viewController: UIViewController = UIViewController()
            switch (indexPath.row) {
            case 0:
                viewController = MainPageViewController()
            case 1:
                viewController = DestinationsViewController()
            case 2:
                viewController = SalesViewController()
            case 3:
                viewController = ExcursionViewController()
            default:
                print("default")
            }
            topVC.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension NavigationBarView : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
    }
}






