//
//  DestinationSelectView.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 29.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class DestinationSelectView: UIView {
    
    @IBOutlet var destinationSelectView: UIView!
    
    var remember = true
    var destinationMenu : DestinationMenuView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: DestinationSelectView.self), owner: self, options: nil)
        destinationSelectView.addCustomContainerView(self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        destinationSelectView.addGestureRecognizer(tap)
        destinationSelectView.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        if self.remember == true{
            if let topVC = UIApplication.getTopViewController() {
                UIView.animate(withDuration: 2, animations: {
                    self.destinationMenu = DestinationMenuView ()
                    self.destinationMenu!.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
                    topVC.view.addSubview(self.destinationMenu!)
                }, completion: { (finished) in
                    if finished{
                    }
                })
            }
            print("true")
        }else{
            print("false")
        }
        self.remember = !remember
    }
}
