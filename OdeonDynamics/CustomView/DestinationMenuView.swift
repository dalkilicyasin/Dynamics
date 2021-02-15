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
    @IBOutlet var destinationMenuView: UIView!
    @IBOutlet weak var secondView: UIView!
    
   
    var destinationModuleList = DestinationMenuVM()
    
    let datas = ["firstdata","secondData","thirdData"]
    
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
        destinationMenuView.addCustomContainerView(self)
        
        secondView.layer.cornerRadius = 7
        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableView.automaticDimension
        
   
       // self.destinationModuleList.destinationList = searchDestination
        
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
        
            return destinationModuleList.destinationList.count
        
       
       // self.destinationModuleList.destinationList.count
        //    self.searchDestination.count
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DestinationMenuTableViewCell.identifier) as! DestinationMenuTableViewCell
    
        if self.destinationModuleList.destinationList.count > 0 {
      // cell.setInfo(destinationMenu: destinationModuleList.destinationList[indexPath.row])
      cell.setInfo(destinationMenu: destinationModuleList.destinationList[indexPath.row])
         
            // cell.infoLAbel.text = filteredData[indexPath.row]
        }else{
            self.tableView.reloadData()
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
        
      /*  if searchText.isEmpty == true {
            self.destinationModuleList.destinationList = searchDestination
            self.tableView.reloadData()
        }else {
            self.destinationModuleList.destinationList = searchDestination.filter({ (destination) -> Bool in
                (destination.description?.lowercased().contains(searchText.lowercased()))!
            })
            self.tableView.reloadData()
        }*/
        
        filteredData = []
        
        if searchText == "" {
            filteredData = destinationModuleList.destinationList
        }else {
            for data in destinationModuleList.destinationList{
                
                if destinationModuleList.destinationList.description.lowercased().contains(searchText.lowercased()){
                    
                    filteredData.append(data)
                
            }
        }
        
        }
        self.tableView.reloadData()
   
}
}
