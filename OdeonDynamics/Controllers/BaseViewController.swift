//
//  BaseViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 17.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation

import UIKit

public class BaseViewController: UIViewController{
    
    let baseData:BaseData =  BaseData.shared

    override public func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle  = .light
        }
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
