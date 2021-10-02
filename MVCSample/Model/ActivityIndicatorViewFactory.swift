//
//  ActivityIndicatorViewFactory.swift
//  MVCSample
//
//  Created by chanick park on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

//
// ActivityIndicatorViewFactory
//
struct ActivityIndicatorViewFactory {
    /**
     * @desc Create UIActivity Indicator View, displayed on the super view
     * @return UIActivityIndicatorView
     */
    static func create(superview: UIView) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(activityIndicatorView)
        superview.addConstraints(center(view: activityIndicatorView, in: superview))
        return activityIndicatorView
    }
    
    /**
     * @desc Center position
     * @return [NSLayoutConstraint]
     */
    private static func center(view: UIView, in superview: UIView) -> [NSLayoutConstraint] {
        let centerX = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0)
        return [centerX, centerY]
    }
}
