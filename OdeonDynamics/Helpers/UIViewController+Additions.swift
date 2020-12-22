//
//  UIViewController+Additions.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22/11/20.
//  Copyright © 2020 Akif Demirezen. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
extension UIViewController {
    func noInternetConnectionError() {
        if !(NetworkReachabilityManager()?.isReachable)! {
            let alertController = UIAlertController(title: "", message: ErrorCodes["E0001"], preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                exit(0)})
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func alert(message: String, title: String = "", completion: (() -> Swift.Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: completion)
        }
    }

    func showProgressHUD(_ currentView: UIView? = nil, _ message: String = "") {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            DispatchQueue.main.async {
                MBProgressHUD.showAdded(to: self.view, animated: true)
            }
        }
    }

    func hideProgressHUD(_ currentView: UIView? = nil) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
}

enum AppStoryboard: String {
    case Main
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: .main)
    }
    func viewController<T: UIViewController>(controllerClass: T.Type) -> T {
        let storyboardID = controllerClass.storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    static func instantiate(from appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(controllerClass: self)
    }
}
