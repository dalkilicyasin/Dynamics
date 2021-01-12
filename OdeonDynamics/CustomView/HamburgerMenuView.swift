//
//  HamburgerMenuView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 5.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class HamburgerMenuView: UIView {

    @IBOutlet var hamburgerMenuView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: HamburgerMenuView.self), owner: self, options: nil)
        hamburgerMenuView.addCustomContainerView(self)
    }
    
}
