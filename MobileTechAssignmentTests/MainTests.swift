//
//  MainTests.swift
//  MobileTechAssignmentTests
//
//  Created by Felipe Mota on 02/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import XCTest
@testable import MobileTechAssignment

class MainTests: XCTestCase {
    
    let network = NetworkClient.shared
    var resData: [WeatherCondition]? = nil
    var periods = [Period]()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldPlanVacationWithSuccess() {
//        let result = vacation.planVacationFor(city: "Fortaleza", weatherFilter: ["clear"], duration: 15)
//        let success = ["06-20 - 07-10", "11-20 - 12-10"]
//        XCTAssert(result == success, "Asserting not valid")
    }
    
    func testInfoLoading() {
        
        let cityId = "455821"
        let weatherFilter = ["clear", "partly cloudy", "cold"] //POA
        //let weatherFilter = ["clear", "hot", "partly cloudy", "fair"] //RJ
        
        
        
        let pred = NSPredicate(format: "resData != nil")
        let exp = expectation(for: pred, evaluatedWith: self, handler: nil)
        _ = XCTWaiter.wait(for: [exp], timeout: 5.0)
        XCTAssertNotNil(resData, "No data recived from the server")
    }
    
//    func testFilter() {
//        controller.yearCondition = nil
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
