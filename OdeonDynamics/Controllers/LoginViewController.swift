//
//  LoginViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 22.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var loginview: UIView!
    @IBOutlet weak var checkBoxView: CheckBoxView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.checkBoxView.checkBoxViewDelegate = self
        
       loginview.layer.cornerRadius = 5
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
       self.otiPushViewController(viewController: ModuleViewController())
        
     
    }
}

extension LoginViewController : CheckBoxViewDelegate {
    func checkBoxTapped(isremember: Bool) {
       print(isremember)
    }   
}

