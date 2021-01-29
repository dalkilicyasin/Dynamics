//
//  ExcursionTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 19.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class ExcursionTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.secondView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
        self.secondView.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func setInfo( excursion : ExcursionResponseModel) {
        self.numberLabel.text = excursion.number
        self.infoLabel.text = excursion.description
        self.dataLabel.text = excursion.data
    }
}
