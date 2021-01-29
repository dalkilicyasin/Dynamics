//
//  DestinationTableViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 15.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        
        self.secondView.layer.borderWidth = 1
        self.secondView.layer.cornerRadius = 3
        self.secondView.layer.borderColor = UIColor.clear.cgColor
        self.secondView.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.30
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
    
    func setInfo( destination : DestinationResponseModel) {
        self.infoLabel.text = destination.description
        self.dataLabel.text = destination.data
        self.infoImage.image = UIImage(named: destination.image ?? "")
    }
}
