//
//  NYCSAlertView.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import UIKit

class NYCSAlertView: UIView {

    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: "Sorry", message: "This school does not have SAT Score data, Please select another school", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                viewController.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
        }

}
