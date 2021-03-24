//
//  OperatorMenuView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class TypeListMenuView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewTypeListMenu: UIView!
    @IBOutlet weak var buttonSelect: UIButton!
    
    var typeListSelectView : TypeListSelectView?
    var companyResponse : GetTypeListByUserIdResponseModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: TypeListMenuView.self), owner: self, options: nil)
        viewTypeListMenu.addCustomContainerView(self)
        
        buttonSelect.layer.cornerRadius = 7
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TypeListMenuTableViewCell.nib, forCellReuseIdentifier: TypeListMenuTableViewCell.identifier)
        
        self.typeListSelectView?.typeListDelegate = self
    }

    @IBAction func buttonClicked(_ sender: Any) {
        self.removeFromSuperview()
    }
}

extension TypeListMenuView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.companyResponse?.typelist?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TypeListMenuTableViewCell.identifier) as! TypeListMenuTableViewCell
        cell.setInfo(operatormenu: (companyResponse?.typelist![indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }  
}
extension TypeListMenuView : TypeListDelegate {
    func typeListSeletcViewTapped(typeList: GetTypeListByUserIdResponseModel) {
        self.companyResponse = typeList
        self.tableView.reloadData()
    }
}
