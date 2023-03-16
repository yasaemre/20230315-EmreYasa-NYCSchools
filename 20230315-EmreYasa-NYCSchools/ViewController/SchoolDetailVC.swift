//
//  SchoolDetailVC.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation
import UIKit

class SchoolDetailVC:UIViewController {
    let detailView = NYCSSchoolDetailView(frame: UIScreen.main.bounds)
    var schoolVM = [NYCSSchoolDetailVM]()
    var alertView = NYCSAlertView()
    let activityIndicator = NYCSActivityIndicator()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPDetailView()
        fetchSchoolById()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.loadActivityIndicator(in: self.view)
        view.addSubview(activityIndicator.activityIndicator)
    }
    
    private func setUPDetailView() {
        view.addSubview(detailView)
        view.backgroundColor = .systemBackground
    }
    
    private func fetchSchoolById() {
        activityIndicator.startAnimating(in: view)
        view.isUserInteractionEnabled = false
        APICaller.shared.fetchSchool(for: detailView.schoolId) { [weak self] result in
            switch result {
            case.success(let school):
                self?.schoolVM = school.compactMap({
                    NYCSSchoolDetailVM(school: $0)
                })
                
                DispatchQueue.main.async { [weak self] in
                    if let title = (school.first?.name) {
                        self?.title = title
                    } else {
                        if self != nil {
                            self?.alertView.showAlert(title: "Sorry", message: "This school does not have SAT Score data, Please select another school", viewController: self!)
                        }
                    }
                    self?.configureDetailView()
                    self?.activityIndicator.stopAnimating(in: self!.detailView)
                    self?.view.isUserInteractionEnabled = true
                }
                
            case .failure(_):
                fatalError()
            }
        }
    }

    private func configureDetailView() {
        detailView.schoolNameLabel.text = "School Name: \(schoolVM.first?.title ?? "")"
        detailView.numOfSATTestTakersLabel.text = "The number of Test Takers: \(schoolVM.first?.numOfSATTestTakers ?? "")"
        detailView.readingAvrScoreLabel.text = "Reading Average Score: \(schoolVM.first?.readingAvrScore ?? "")"
        detailView.mathAvrScoreLabel.text = "Mathematics Average Score: \(schoolVM.first?.mathAvrScore ?? "")"
        detailView.writtingAvrScoreLabel.text = "Writing Average Score: \(schoolVM.first?.writtingAvrScore ?? "")"
       }
}

