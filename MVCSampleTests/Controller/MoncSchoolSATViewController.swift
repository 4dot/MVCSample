//
//  MoncSchoolSATViewController.swift
//  MVCSampleTests
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


import XCTest
@testable import MVCSample

//
// MockSchoolSATViewController
//
class MockSchoolSATViewController: XCTestCase {
    // create school SAT network manager with mock client
    var schoolSATNetworkManager = MockSchoolSATNetworkManager(client: MockSchoolNetworkClient())
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchSchoolSAT() throws {
        // Request Schools List (load from local json file)
        let test_dbn = "01M292"
        
        schoolSATNetworkManager.requestSchoolSAT(dbn: test_dbn) { (result) in
            switch result {
            case .success(let schoolsSAT):
                // check count
                XCTAssertEqual(schoolsSAT.count, 478)
                
                // check existing data
                let school = schoolsSAT.filter { $0.dbn == test_dbn }.first
                XCTAssert(school != nil)
                
                // check detials
                XCTAssertEqual(school!.school_name, "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES")
                
            case .failure(let errors):
                XCTFail(errors.first?.description ?? "")
            }
        }
    }
}
