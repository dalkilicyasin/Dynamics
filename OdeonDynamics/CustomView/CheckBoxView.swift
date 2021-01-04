//
//  CheckBoxView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 29.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

/*protocol CheckDelegate {
 func checkBoxImage()
 func didTabCheckbox()
 }*/

protocol CheckBoxViewDelegate {
    func checkBoxTapped(isremember : Bool)
}

class CheckBoxView: UIView{
    
    @IBOutlet var checkBoxView: UIView!
    @IBOutlet weak var checkImage: UIImageView!
    
    var checkBoxViewDelegate : CheckBoxViewDelegate?
    var isCheckRemember = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: CheckBoxView.self), owner: self, options: nil)
        checkBoxView.addCustomContainerView(self)
        checkImage.isHidden = true
        checkBoxView.layer.borderWidth = 0.5
        checkBoxView.layer.borderColor = UIColor.lightGray.cgColor
        checkBoxView.layer.cornerRadius = 4
        checkImage.layer.cornerRadius = 5
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTabCheckbox))
        checkBoxView.addGestureRecognizer(gesture)
    }
    
    @objc func didTabCheckbox() {
        self.isCheckRemember = !isCheckRemember
        if self.isCheckRemember{
            checkImage.isHidden = false
        }else {
            checkImage.isHidden = true
        }
        self.checkBoxViewDelegate?.checkBoxTapped(isremember: true)
    }
}







