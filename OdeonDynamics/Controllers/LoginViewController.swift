//
//  LoginViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 22.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var headerView: OdeonHeaderView!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var checkBoxView: CheckBoxView!
    @IBOutlet weak var textfieldUsername: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    
    var data : Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.checkBoxView.checkBoxViewDelegate = self
    buttonLogin.layer.cornerRadius = 5
        
        let createTokenRequestModel = CreateTokenRequestModel.init()
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .CreateToken, requestModel: createTokenRequestModel) { (response: BaseResponse<GetTokenResponse>) in
            if response.isSuccess ?? false {
                self.baseData.getTokenResponse = response
                print("token received - \(response.token ?? "")")
            }
        }
        
       
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
   self.otiPushViewController(viewController: ModuleViewController())
       let getUserRequestModel = self.getBaseRequestData(data: GetUserRequestModel.init(userId: 1))
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .GetUser, requestModel: getUserRequestModel) { (response: BaseResponse<GetUserResponseModel>) in
            if response.isSuccess ?? false {
                
            }
        }
    }
}

extension LoginViewController : CheckBoxViewDelegate {
    func checkBoxTapped(isremember: Bool) {
       print(isremember)
    }   
}

