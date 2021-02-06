//
//  OperatorMenuTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class OperatorMenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var coralImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setInfo( operatormenu : OperatorMenuResponseModel ) {
        self.infoLabel.text = operatormenu.description
        self.coralImage.image = UIImage(named: operatormenu.image ?? "")
    } 
}
