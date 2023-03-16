//
//  NYCSSchoolDetailView.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//


import UIKit

class NYCSSchoolDetailView: UIView {

    lazy var schoolId:String = {
        let schoolId = ""
        return schoolId
    }()

     lazy var schoolNameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
     lazy var numOfSATTestTakersLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
     lazy var readingAvrScoreLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.minimumScaleFactor = 0.9
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
     lazy var mathAvrScoreLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.minimumScaleFactor = 0.9
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
     lazy var writtingAvrScoreLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.minimumScaleFactor = 0.9
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = true
        configureSubviews()
        setupConstraints()
        setUpnumOfSATTestTakersLabel()
        setUpReadingAvrScoreLabel()
        setUpMathAvrScoreLabel()
        setUpWrittingAvrScoreLabel()
    }
    
    private func configureSubviews() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(schoolNameLabel)
        stackView.addArrangedSubview(numOfSATTestTakersLabel)
        stackView.addArrangedSubview(readingAvrScoreLabel)
        stackView.addArrangedSubview(mathAvrScoreLabel)
        stackView.addArrangedSubview(writtingAvrScoreLabel)
    }
    
    private func setupConstraints() {
        setUpSchoolNameLabel()
        setUpnumOfSATTestTakersLabel()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
    }

    private func setUpSchoolNameLabel() {
        NSLayoutConstraint.activate([
            schoolNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            schoolNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            schoolNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpnumOfSATTestTakersLabel() {
        NSLayoutConstraint.activate([
            numOfSATTestTakersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            numOfSATTestTakersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpReadingAvrScoreLabel() {
        NSLayoutConstraint.activate([
            readingAvrScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            readingAvrScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpMathAvrScoreLabel() {
        NSLayoutConstraint.activate([
            mathAvrScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mathAvrScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpWrittingAvrScoreLabel() {
        NSLayoutConstraint.activate([
            writtingAvrScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            writtingAvrScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
