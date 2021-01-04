//
//  BaseTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
