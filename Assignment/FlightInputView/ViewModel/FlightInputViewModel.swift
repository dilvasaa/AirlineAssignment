//
//  FlightInputViewModel.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import Foundation
import Combine


/// This class handles the view logic for `FlightInputViewController`
class FlightInputViewModel {
    private let handlerService: FlightInputViewHandlerProtocol
    private let dateHandler: DateHandler
    @Published private(set) var flights: [Flight]?
    @Published private(set) var errorMessage:  String?
    @Published private(set) var isDatePickerViewHidden:  Bool = true
    
    init(handlerService: FlightInputViewHandlerProtocol = FlightInputViewHandler() ) {
        self.handlerService =  handlerService
        self.dateHandler = DateHandler()
    }
    
    func changeDatePickerState(state: Bool) {
        isDatePickerViewHidden = state
    }
    
    func didTapGetFlightData(origin: String?, destination: String?, flightDate: Date?) {
        guard let origin = origin, let destination = destination, let flightDate = flightDate else {
            errorMessage = "Please enter all details properly"
            return
        }
        if origin.count != 3 || destination.count != 3 {
            errorMessage = "Origin and destination must be 3 character letters only"
        }
        let strDate = getDateInString(flightDate: flightDate)
        getFilghtInformation(fromDate: strDate, toDate: strDate, origin: origin, destination: destination)
        
    }
    
    func getDateInString(flightDate: Date) -> String {
        return dateHandler.getDateInString(date: flightDate, format: "YYYY-MM-dd")
    }
    
    
    /// calls the handler to get the  data.
    private func getFilghtInformation(fromDate: String, toDate: String, origin: String, destination: String) {
        handlerService.getFilghtInformation(fromDate: fromDate, toDate: toDate, origin: origin, destination: destination) {[weak self] result in
            switch result {
            case .success(let model):
                self?.flights = model.flights ?? []
            case .failure(let error):
                switch error {
                case .runtimeError(let message):
                    self?.flights = []
                    self?.errorMessage = message
                }
            }
        }
    }
}
