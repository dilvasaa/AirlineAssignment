//
//  FlightInputViewHandler.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import Foundation


protocol FlightInputViewHandlerProtocol {
    func getFilghtInformation(fromDate: String, toDate: String, origin: String, destination: String, completion:@escaping (Result<FlightInfo, APIError>) -> Void)
    
}

/// Concrete class to call the  list API.
class FlightInputViewHandler: FlightInputViewHandlerProtocol {
    func getFilghtInformation(fromDate: String,
                              toDate: String,
                              origin: String,
                              destination: String,
                              completion: @escaping (Result<FlightInfo, APIError>) -> Void) {
        RestAPIClient.getFilghtInformation(fromDate: fromDate,
                                           toDate: toDate,
                                           origin: origin,
                                           destination: destination,
                                           completion: completion)
    }
    
}
