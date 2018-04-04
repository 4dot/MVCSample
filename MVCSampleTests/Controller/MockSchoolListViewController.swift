//
//  MockSchoolListViewController.swift
//  MVCSampleTests
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


import XCTest
@testable import MVCSample

// Create Mock Class
class MockSchoolListViewController: XCTestCase {
    // Create school network manager with mock school network client
    var schoolNetworkManager = MockSchoolNetworkManager(client: MockSchoolNetworkClient())
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchSchoolList() throws {
        // Request Schools List (load from local json file)
        schoolNetworkManager.requestSchoolsList { (result) in
            switch result {
            case .success(let schools):
                XCTAssertEqual(schools.count, 440)
                
            case .failure(let errors):
                XCTFail(errors.first?.description ?? "")
            }
        }
    }
}
