//
//  DestinationMenuTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationMenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var infoLAbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.secondView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
        self.secondView.layer.cornerRadius = 5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInfo(destinationMenu : DestinationMenuResponseModel) {
        self.infoLAbel.text = destinationMenu.description
    }
}
