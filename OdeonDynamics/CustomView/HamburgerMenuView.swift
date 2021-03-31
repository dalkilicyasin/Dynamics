//
//  HamburgerMenuView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 5.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class HamburgerMenuView: UIView {
    var navBar : NavigationBarView?
    @IBOutlet var viewHamburgerMenu: UIView!
    var remember = true
    
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
        viewHamburgerMenu.addCustomContainerView(self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewHamburgerMenu.addGestureRecognizer(tap)
        viewHamburgerMenu.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        if self.remember == true{
            if let topVC = UIApplication.getTopViewController() {
                UIView.animate(withDuration: 2, animations: {
                    self.navBar = NavigationBarView()
                    self.navBar!.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
                    topVC.view.addSubview(self.navBar!)
                }, completion: { (finished) in
                    if finished{
                        
                    }
                })
            }
            
            print("true")
        }else{
            print("false")
            self.navBar!.removeFromSuperview()
        }
        
        //self.remember = !remember
    }
}
