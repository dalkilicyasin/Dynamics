//
//  LoginViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 22.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var headerView: OdeonHeaderView!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var checkBoxView: UIView!
    var isCheckRemember = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkImage.isHidden = true
        checkBoxView.layer.borderWidth = 0.5
        checkBoxView.layer.borderColor = UIColor.lightGray.cgColor
        checkBoxView.layer.cornerRadius = 4
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTabCheckbox))
        checkBoxView.addGestureRecognizer(gesture)
        checkImage.layer.cornerRadius = 5
    }
    
    @objc func didTabCheckbox() {      
        self.isCheckRemember = !isCheckRemember
        if self.isCheckRemember{
            checkImage.isHidden = false
            print(isCheckRemember)
        }else {
            checkImage.isHidden = true
            print(isCheckRemember)
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
    }
    
}

