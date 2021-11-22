//
//  FlightListViewController.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import UIKit

/// This class handles the  detail page UI.

class FlightListViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var flightsListView: UITableView!
    
    
    
    
    var viewModel: FlightListViewModel
    
    
    // MARK: - Dependencies
    
    init(viewModel: FlightListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: FlightListViewController.self), bundle: Bundle.main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        updateUI()
    }
    
    /// register tableViewcell and row height estimation
    private func registerTableViewCell() {
        flightsListView.register(FlightListTableViewCell.nib,
                                 forCellReuseIdentifier: FlightListTableViewCell.identifier)
        
    }
    
    // MARK: - Custom Methods
    
    private func updateUI() {
        flightsListView.reloadData()
    }
    
    
    
}

extension FlightListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.flights.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightListTableViewCell.identifier, for: indexPath) as? FlightListTableViewCell else { return UITableViewCell() }
        cell.didUpdateView(flight: viewModel.flights[indexPath.row], dateHandler: viewModel.dateHanlder)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
