//
//  MainPageCollectionViewCell.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 3.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class MainPageCollectionViewCell: BaseCollectionViewCell {
    
   
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var imageMainPage: UIImageView!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var viewMainPage: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewMainPage.layer.cornerRadius = 10 
    }
    
    func setInfo (mainpage : MainPageResponseModel ) {
        self.labelTop.text = mainpage.toplabel
        self.imageMainPage.image = UIImage(named: mainpage.image ?? "")
        self.labelData.text = mainpage.datalabel
    }
}
