//
//  ExtensionUIViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func otiPushViewController(identifier : String, animated: Bool = true) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        self.otiPushViewController(viewController: viewController, animated: animated)
    }
    
    func otiPresentViewController(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.present(viewController, animated: animated, completion: completion)
    }
    
    func otiPushViewController(viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
}
