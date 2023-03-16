//
//  NYCSActivityIndicator.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import UIKit

struct NYCSActivityIndicator {
    let activityIndicator = UIActivityIndicatorView()
     func loadActivityIndicator(in view: UIView) {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = .darkGray
        activityIndicator.style = .large
        activityIndicator.color = .darkGray
        view.addSubview(activityIndicator)
    }
    
    func startAnimating(in view:UIView) {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(in view:UIView) {
        activityIndicator.stopAnimating()
    }
}
