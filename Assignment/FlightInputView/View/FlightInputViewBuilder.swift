//
//  FlightInputViewBuilder.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import UIKit



/// This class gives the `FlightInputViewController` object.
class FlightInputViewBuilder {
     func flightInputView() -> UIViewController {
        let viewController = FlightInputViewController(viewModel: FlightInputViewModel())
        return viewController
    }
}
