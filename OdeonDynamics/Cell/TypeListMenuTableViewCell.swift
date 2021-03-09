//
//  OperatorMenuTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class TypeListMenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imageCompany: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInfo( operatormenu : TypeList ) {
        self.labelInfo.text = operatormenu.subTypeName
        self.imageCompany.image = UIImage(named: operatormenu.iconImages?.image_Url ?? "")
    } 
}
