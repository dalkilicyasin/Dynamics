//
//  OperatorSelectView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 16.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class OperatorSelectView: UIView {
    
    var operationMenuBar : OperatorMenuView?
    var remember = true
    
 
    @IBOutlet var viewOperatorSelect: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: OperatorSelectView.self), owner: self, options: nil)
        viewOperatorSelect.addCustomContainerView(self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewOperatorSelect.addGestureRecognizer(tap)
        viewOperatorSelect.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        if self.remember == true{
            if let topVC = UIApplication.getTopViewController() {
                UIView.animate(withDuration: 2, animations: {
                    self.operationMenuBar = OperatorMenuView()
                    self.operationMenuBar!.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
                    topVC.view.addSubview(self.operationMenuBar!)
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
