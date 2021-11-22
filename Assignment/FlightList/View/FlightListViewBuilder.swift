//
//  FlightListViewBuilder.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import UIKit

/// This class gives the `FlightListViewController` object.

class FlightListViewBuilder {
    func flightListView(flights: [Flight]) -> UIViewController {
        let viewController = FlightListViewController(viewModel: FlightListViewModel(flights: flights))
        return viewController
    }
}
