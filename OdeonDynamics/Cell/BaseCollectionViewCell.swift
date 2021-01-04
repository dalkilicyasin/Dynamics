//
//  BaseCollectionViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 3.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
