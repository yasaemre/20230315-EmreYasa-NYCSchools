//
//  NYCSSchoolDetail.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation

class NYCSSchoolDetailVM {
    let title:String?
    let idSchool:String
    var numOfSATTestTakers:String
    var readingAvrScore:String
    var mathAvrScore:String
    var writtingAvrScore:String
    
    //Dependency Injection
    init(school: SchoolDetail) {
        self.title = school.name
        self.idSchool = school.id
        self.numOfSATTestTakers = school.numOfSATTestTakers
        self.readingAvrScore = school.readingAvrScore
        self.mathAvrScore = school.mathAvrScore
        self.writtingAvrScore = school.writtingAvrScore
    }
}
