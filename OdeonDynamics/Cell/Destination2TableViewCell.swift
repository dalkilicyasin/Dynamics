//
//  Destination2TableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 15.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class Destination2TableViewCell: BaseTableViewCell {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var secondView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        backgroundColor = .clear
        self.secondView.layer.borderWidth = 1
        self.secondView.layer.cornerRadius = 3
        self.secondView.layer.borderColor = UIColor.clear.cgColor
        self.secondView.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.18
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
    
    func setInfo( destination2 : Destination2ResponseModel) {
        
        self.infoLabel.text = destination2.description
        self.dataLabel.text = destination2.data
        self.infoImage.image = UIImage(named: destination2.image ?? "")
    }
}
