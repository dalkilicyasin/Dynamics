//
//  ExcursionTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 19.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class ExcursionTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var viewSecond: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewSecond.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
        self.viewSecond.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func setInfo( excursion : ExcursionResponseModel) {
        self.labelNumber.text = excursion.number
        self.labelInfo.text = excursion.description
        self.labelData.text = excursion.data
    }
}
