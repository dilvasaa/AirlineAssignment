//
//  FlightListViewModel.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import UIKit

/// This class handles the  view logic for `FlightListViewController`

class FlightListViewModel {
    private(set) var flights: [Flight]
    private(set) var dateHanlder: DateHandler
    
    init(flights: [Flight]) {
        self.flights = flights
        dateHanlder = DateHandler()
    }
}
