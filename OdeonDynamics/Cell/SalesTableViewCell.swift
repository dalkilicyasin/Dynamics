//
//  SalesTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 17.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class SalesTableViewCell: BaseTableViewCell {
 
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var viewSecond: UIView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        self.viewSecond.layer.borderWidth = 1
        self.viewSecond.layer.cornerRadius = 3
        self.viewSecond.layer.borderColor = UIColor.clear.cgColor
        self.viewSecond.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    func setInfo( sales : SalesResponseModel) {
        self.labelInfo.text = sales.description
        self.labelData.text = sales.data
    }
}
