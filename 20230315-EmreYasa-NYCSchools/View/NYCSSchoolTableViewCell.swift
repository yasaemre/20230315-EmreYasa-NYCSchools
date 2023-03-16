//
//  NYCSSchoolTableViewCell.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation
import UIKit

class NYCSSchoolTableViewCell: UITableViewCell {
    static let reusId = "NYCSSchoolTableViewCell"
    
    private lazy var schoolTitle:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(schoolTitle)
        setUpConstraintsDessertTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraintsDessertTitle() {
        schoolTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            schoolTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            schoolTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            schoolTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            schoolTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20),
            schoolTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    func configure(with viewModel:NYCSSchoolCellVM) {
        schoolTitle.text = viewModel.title
    }
}
