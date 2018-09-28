//
//  RelaxTests.swift
//  RelaxTests
//
//  Created by Honglin Yi on 9/28/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import Relax

class RelaxTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRelaxBridingHeader() {
        let header = TestBridgingHeader()
        XCTAssert(header.tryBoolean() == true, "Test Relax-Bridging-Header")
    }
  
    
}
