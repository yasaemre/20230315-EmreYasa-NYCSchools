//
//  SchoolDetail.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation


struct APIResponseForSchool:Decodable {
    var schools: [SchoolDetail]
    
    func toSchoolsArray() -> [SchoolDetail] {
        return schools
    }
    
    enum CodingKeys: String, CodingKey {
        case schools = "data"
    }
}

struct SchoolDetail: Decodable {
    var name:String
    var id:String
    var numOfSATTestTakers:String
    var readingAvrScore:String
    var mathAvrScore:String
    var writtingAvrScore:String
   
    
    
    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case id = "dbn"
        case numOfSATTestTakers = "num_of_sat_test_takers"
        case readingAvrScore = "sat_critical_reading_avg_score"
        case mathAvrScore = "sat_math_avg_score"
        case writtingAvrScore = "sat_writing_avg_score"
    }
}
