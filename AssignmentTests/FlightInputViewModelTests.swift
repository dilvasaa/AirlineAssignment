//
//  FlightInputViewModelTests.swift
//  AssignmentTests
//
//  Created by Dileep vasa on 21/11/21.
//

import XCTest
import Combine
@testable import Assignment

class FlightInputViewModelTests: XCTestCase {
    
    func testContentList() {
        let vc = FlightInputViewModel(handlerService: MockFlightInputViewHandler())
        vc.didTapGetFlightData(origin: "Lex", destination: "flex", flightDate: Date())
        XCTAssert(vc.flights?.count == 10)
        
    }
    

}
