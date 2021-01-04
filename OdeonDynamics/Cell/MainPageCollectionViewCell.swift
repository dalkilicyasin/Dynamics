//
//  MainPageCollectionViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 3.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class MainPageCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var topLAbel: UILabel!
    @IBOutlet weak var mainPageImage: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var mainPageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainPageView.layer.cornerRadius = 10 
    }
    
    func setInfo (mainpage : MainPageResponseModel ) {
        self.topLAbel.text = mainpage.toplabel
        self.mainPageImage.image = UIImage(named: mainpage.image ?? "")
        self.dataLabel.text = mainpage.datalabel
    }
}
