//
//  MockFlightInputViewHandler.swift
//  AssignmentTests
//
//  Created by Dileep vasa on 21/11/21.
//

import Foundation
@testable import Assignment

class MockFlightInputViewHandler: FlightInputViewHandlerProtocol {
    func getFilghtInformation(fromDate: String, toDate: String, origin: String, destination: String, completion:@escaping (Result<FlightInfo, APIError>) -> Void) {
        guard let jsonData = readLocalJson(forName: "FlightListResponse") else {
            completion(.failure(.runtimeError("No Data Found")))
            return
        }
        do {
            let decodedData = try JSONDecoder().decode(FlightInfo.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            print("error: \(error)")
            completion(.failure(.runtimeError("No Data Found")))
            
        }
    }
    

    
    func readLocalJson(forName name: String) -> Data? {
        do {
            guard let fileUrl = Bundle.main.url(forResource: name, withExtension: "json") else { return nil }
            let data = try Data(contentsOf: fileUrl)
            return data
            
        } catch {
            print("error: \(error)")
            return nil
            
        }
    }
    
    
    func parse(jsonData: Data) -> FlightInfo? {
        do {
            let decodedData = try JSONDecoder().decode(FlightInfo.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
            return nil
        }
    }
    
    
}
