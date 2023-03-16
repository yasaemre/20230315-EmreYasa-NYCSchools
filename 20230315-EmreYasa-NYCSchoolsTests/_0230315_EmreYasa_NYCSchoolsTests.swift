//
//  _0230315_EmreYasa_NYCSchoolsTests.swift
//  20230315-EmreYasa-NYCSchoolsTests
//
//  Created by Emre Yasa on 3/15/23.
//

import XCTest
@testable import _0230315_EmreYasa_NYCSchools

final class _0230315_EmreYasa_NYCSchoolsTests: XCTestCase {

    func test_0230315_EmreYasa_NYCSchoolsTests() {
        let school = Schools(name: "BROOKLYN STUDIO SECONDARY SCHOOL", idSchool: "21K690")
        let schoolViewModel = NYCSSchoolCellVM(schools: school)
        XCTAssertEqual(school.name, schoolViewModel.title)
        XCTAssertEqual(school.idSchool, schoolViewModel.idSchool)
    }
    
    func testNYCSSchoolDetailView() {
        let schoolById = SchoolDetail(name: "LIBERATION DIPLOMA PLUS", id: "21K728", numOfSATTestTakers: "119", readingAvrScore: "429", mathAvrScore: "449", writtingAvrScore: "435")
        let schoolDetailViewModel = NYCSSchoolDetailVM(school: schoolById)
        
        XCTAssertEqual(schoolById.name, schoolDetailViewModel.title)
        XCTAssertEqual(schoolById.numOfSATTestTakers, schoolDetailViewModel.numOfSATTestTakers)
        XCTAssertEqual(schoolById.mathAvrScore, schoolDetailViewModel.mathAvrScore)
        XCTAssertEqual(schoolById.writtingAvrScore, schoolDetailViewModel.writtingAvrScore)
    }

}
