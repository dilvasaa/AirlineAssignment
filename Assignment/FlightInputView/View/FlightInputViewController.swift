//
//  FlightInputViewController.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import UIKit
import Combine


/// This class handles the content list page UI.
class FlightInputViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var flightDateButton: UIButton!
    @IBOutlet weak var flightDateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerStackView: UIStackView!
    
    
    
    
    // MARK: - Variables
    
    var viewModel: FlightInputViewModel
    
    private var bag = Set<AnyCancellable>()
    
    
    
    // MARK: - Dependencies
    
    init(viewModel: FlightInputViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: FlightInputViewController.self), bundle: Bundle.main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flight Details"
        bindViewModel()
    }
    
    
    // MARK: - Private custom methods
    
    // binds the ViewModel to controller
    private func bindViewModel() {
        viewModel.$flights.sink { [weak self] flights in
            ActivityManager.sharedInstance.hideActivityIndicator()
            if let flights = flights {
                self?.didGetFlights(flights: flights)
            }
        }
        .store(in: &bag)
        
        viewModel.$errorMessage.sink { [weak self] errorMessage in
            ActivityManager.sharedInstance.hideActivityIndicator()
            self?.showErrorMessage(errorMessage: errorMessage)
        }
        .store(in: &bag)
        
        viewModel.$isDatePickerViewHidden.sink { [weak self] pickerState in
            self?.datePickerStackView.isHidden = pickerState
        }
        .store(in: &bag)
        
    }
    
    private func didGetFlights(flights: [Flight]) {
        navigateToDetail(flights: flights)
    }
    
    private func showErrorMessage(errorMessage: String?) {
        
    }
    
    
    private func navigateToDetail(flights: [Flight]) {
        let contentVC = FlightListViewBuilder().flightListView(flights: flights)
        navigationController?.pushViewController(contentVC, animated: true)
    }
    
    
    
    @IBAction func getFlightDetailsTapped(_ sender: Any) {
        ActivityManager.sharedInstance.showActivityIndicator()
        viewModel.didTapGetFlightData(origin: originTextField.text,
                                      destination: destinationTextField.text,
                                      flightDate: datePicker.date)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.changeDatePickerState(state: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        flightDateTextField.text = viewModel.getDateInString(flightDate: datePicker.date)
        viewModel.changeDatePickerState(state: true)
        
    }
    
    @IBAction func fligtDateTapped(_ sender: UIButton) {
        viewModel.changeDatePickerState(state: false)
    }
    
}

