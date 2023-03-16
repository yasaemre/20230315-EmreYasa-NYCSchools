//
//  Schools.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation

struct APIResponse: Codable {
    var schools: [Schools]
    
    func toSchoolsArray() -> [Schools] {
        return schools
    }
    
    enum CodingKeys: String, CodingKey {
        case schools = "data"
    }
}

struct Schools: Codable, Hashable {
    var name: String?
    var idSchool: String
    
    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case idSchool = "dbn"
    }
}


