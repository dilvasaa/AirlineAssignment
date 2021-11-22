//
//  FlightListTableViewCell.swift
//  Assignment
//
//  Created by Dileep vasa on 22/11/21.
//

import UIKit

class FlightListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func didUpdateView(flight: Flight?, dateHandler: DateHandler) {
        flightNumberLabel.text = flight?.flightDetails?.operatingFlightNumber
        if let outTime = flight?.flightDetails?.flightLegs?.first?.estimatedDateTimeUTC?.outTime, let outTimeDate = dateHandler.getDateFromString(date: outTime, format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            arrivalTimeLabel.text = dateHandler.getDateInString(date: outTimeDate, format: "yyyy-MM-dd HH:mm")
        }
        if let inTime = flight?.flightDetails?.flightLegs?.first?.estimatedDateTimeUTC?.inTime, let inTimeDate = dateHandler.getDateFromString(date: inTime, format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            departureTimeLabel.text = dateHandler.getDateInString(date: inTimeDate, format: "yyyy-MM-dd HH:mm")
        }
            
    }
    
    
}
