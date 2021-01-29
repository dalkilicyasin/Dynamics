//
//  ModuleTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class ModuleTableViewCell: BaseTableViewCell{
    
    @IBOutlet weak var labelModule: UILabel!
    @IBOutlet weak var imageViewModule: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInfo(module : ModuleResponseModel) {
        self.labelModule.text = module.name
        self.imageViewModule.image = UIImage(named: module.image ?? "")
    }
}
