//
//  NYCSSchoolCellVM.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation

class NYCSSchoolCellVM {
    let title:String?
    let idSchool:String
    
    //Dependency Injection
    init(schools: Schools) {
        self.title = schools.name
        self.idSchool = schools.idSchool
    }
}
