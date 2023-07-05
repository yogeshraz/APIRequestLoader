//
//  UIAlertController+Extension.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 05/07/23.
//

import UIKit

extension UIAlertController {
    
    class func showAlert(title : String, msg : String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let actionOK : UIAlertAction = UIAlertAction(title: "Ok", style: .default) { (alt) in
        }
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .white
        
        alert.addAction(actionOK)
        Constants.kSceneDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithAction(title : String, msg : String, successClosure: @escaping () -> () ) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let actionOK : UIAlertAction = UIAlertAction(title: "OK", style: .default) { (alt) in
            successClosure()
        }
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .white
        alert.addAction(actionOK)
        Constants.kSceneDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithMultipleActions(title : String, msg : String, btnTitle1 : String, btnTitle2 : String, successClosure: @escaping (String?) -> (), cancelClosure: @escaping (String?) -> ()) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let actionOK : UIAlertAction = UIAlertAction(title: btnTitle1, style: .default) { (alt) in
            successClosure("success")
        }
        let actionCancel : UIAlertAction = UIAlertAction(title: btnTitle2, style: .cancel) { (alt) in
            cancelClosure("cancel")
        }
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .white
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        Constants.kSceneDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
