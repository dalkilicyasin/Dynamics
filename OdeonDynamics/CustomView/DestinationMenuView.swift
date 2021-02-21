//
//  DestinationMenuView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 29.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationMenuView: UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewDestinationMenu: UIView!
    @IBOutlet weak var viewSecond: UIView!
    
    var isFilteredTextEmpty = true
    var destinationModuleList = DestinationMenuVM()
    var filteredData : [DestinationMenuResponseModel]!
    
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
        viewDestinationMenu.addCustomContainerView(self)
        
        viewSecond.layer.cornerRadius = 7
        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableView.automaticDimension
        
        self.destinationModuleList.delegate = self
        self.destinationModuleList.getMainPageList()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DestinationMenuTableViewCell.nib, forCellReuseIdentifier: DestinationMenuTableViewCell.identifier)
        
        self.searchBar.delegate = self
        self.filteredData = destinationModuleList.destinationList
    }   
}

extension DestinationMenuView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFilteredTextEmpty == false {
            return self.filteredData.count
        }else{
            return destinationModuleList.destinationList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DestinationMenuTableViewCell.identifier) as! DestinationMenuTableViewCell
        
        if isFilteredTextEmpty == false {
            if self.filteredData.count > 0 {
                cell.setInfo(destinationMenu: filteredData[indexPath.row])
            }else{
                self.tableView.reloadData()
            }
        }else{
            if self.destinationModuleList.destinationList.count > 0 {
                cell.setInfo(destinationMenu: destinationModuleList.destinationList[indexPath.row])
            }else{
                self.tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DestinationMenuView : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.tableView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
        
    }
}

extension DestinationMenuView : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  
        self.filteredData = []
        
        if searchText.elementsEqual(""){
            self.isFilteredTextEmpty = true
            self.filteredData = destinationModuleList.destinationList
        }else {
            self.isFilteredTextEmpty = false
            for data in destinationModuleList.destinationList{
                if data.description!.lowercased().contains(searchText.lowercased()){
                    self.filteredData.append(data)
                }
            }
        }
        self.tableView.reloadData()
        
    }
}
