//
//  OperatorSelectView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 16.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

protocol TypeListDelegate {
    func typeListSeletcViewTapped( typeList : GetTypeListByUserIdResponseModel)
}

class TypeListSelectView: UIView {
    
    var typeListMenuBar : TypeListMenuView?
    var remember = true
    var companyResponse : GetTypeListByUserIdResponseModel?
    var typeListDelegate : TypeListDelegate?
    
    @IBOutlet var viewTypeListSelect: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: TypeListSelectView.self), owner: self, options: nil)
        viewTypeListSelect.addCustomContainerView(self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewTypeListSelect.addGestureRecognizer(tap)
        viewTypeListSelect.isUserInteractionEnabled = true
        
        let getTypeListByUserRequestModel = UIApplication.getTopViewController()!.getBaseRequestData(data: GetTypeListByUserIdRequestModel(userId: userDefaultsData.getUserId(), groupId: OPERATOR_REQUEST_ID))
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .GetUserListById, requestModel: getTypeListByUserRequestModel ) { (response: BaseResponse<GetTypeListByUserIdResponseModel>) in
            if response.isSuccess ?? false {
                self.companyResponse = response.dataObject
                self.typeListDelegate?.typeListSeletcViewTapped(typeList: self.companyResponse!)
                print("response succsess")
            }
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        if self.remember == true{
            if let topVC = UIApplication.getTopViewController() {
                UIView.animate(withDuration: 2, animations: {
                    self.typeListMenuBar = TypeListMenuView()
                    self.typeListMenuBar!.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
                    topVC.view.addSubview(self.typeListMenuBar!)
                }, completion: { (finished) in
                    if finished{
                        
                    }
                })
            }
            
            print("true")
        }else{
            print("false")
            
        }
        
        // self.remember = !remember
    }
}
