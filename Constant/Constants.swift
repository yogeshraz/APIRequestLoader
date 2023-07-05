//
//  Constant.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 05/07/23.
//

import UIKit

public struct Constants {
    
    //Necessary Macros
    static let kAppDelegate         = UIApplication.shared.delegate as! AppDelegate
    static let kUserDefaults        = UserDefaults.standard
    static let kScene               = UIApplication.shared.connectedScenes.first
    static let kSceneDelegate       = (kScene?.delegate as! SceneDelegate)
}
