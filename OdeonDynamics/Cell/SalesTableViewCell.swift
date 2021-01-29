//
//  SalesTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 17.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class SalesTableViewCell: BaseTableViewCell {
 
    @IBOutlet weak var infoLAbel: UILabel!
    @IBOutlet weak var dataLAbel: UILabel!
    @IBOutlet weak var secondView: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        self.secondView.layer.borderWidth = 1
        self.secondView.layer.cornerRadius = 3
        self.secondView.layer.borderColor = UIColor.clear.cgColor
        self.secondView.layer.masksToBounds = true
        
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
        self.infoLAbel.text = sales.description
        self.dataLAbel.text = sales.data
    }
}
