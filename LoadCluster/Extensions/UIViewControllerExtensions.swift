//
//  UIViewControllerExtensions.swift
//  LoadCluster
//
//  Created by ricardo silva on 02/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    
    
    class func instantiateFromStoryboard(_ name: String = "Home") -> Self {
        return instantiateFromStoryboardHelper(name)
    }
    
    private class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let identifier = String(describing: self)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        return controller
    }
    
}
