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
    @IBOutlet var hamburgerMenuView: UIView!
    
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
        hamburgerMenuView.addCustomContainerView(self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        hamburgerMenuView.addGestureRecognizer(tap)
        hamburgerMenuView.isUserInteractionEnabled = true
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
        
        self.remember = !remember
    }
}

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
