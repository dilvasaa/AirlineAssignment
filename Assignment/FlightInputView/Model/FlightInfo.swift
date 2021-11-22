//
//  FlightInfo.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import Foundation

import Foundation

// MARK: - FlightInfo
struct FlightInfo: Codable {
    let flights: [Flight]?
    let actionResult: ActionResult?
}

// MARK: - ActionResult
struct ActionResult: Codable {
    let code: Int?
    let messages: [String]?
}

// MARK: - Flight
struct Flight: Codable {
    let flightDetails: FlightDetails?
    let flightLookupKey: String?
    let updateCount: Int?
}

// MARK: - FlightDetails
struct FlightDetails: Codable {
    let sourceSystemName: String?
    let sourceSystemLastModifiedDateTimeUTC, schemaVersion: String?
    let lastEventType: String?
    let operatingFlightNumber: String?
    let scheduledFlightOriginationDateUTC: String?
    let scheduledFlightOriginationDateLocal: String?
    let flightLegs: [FlightLeg]?

    enum CodingKeys: String, CodingKey {
        case sourceSystemName
        case sourceSystemLastModifiedDateTimeUTC = "sourceSystemLastModifiedDateTimeUtc"
        case schemaVersion, lastEventType, operatingFlightNumber, scheduledFlightOriginationDateUTC, scheduledFlightOriginationDateLocal, flightLegs
    }
}

// MARK: - FlightLeg
struct FlightLeg: Codable {
    let legNumber: Int?
    let scheduledDateTimeUTC: ScheduledDateTimeUTC?
    let estimatedDateTimeUTC: EstimatedDateTimeUTC?
    let actualDepartureStation, actualArrivalStation: ActualStation?
    let actualdatetimeutc: Actualdatetimeutc?
    let irropsType, opsReason: String?
    let scheduledArrivalStation, scheduledDepartureStation: ScheduledStation?
    let codeShares: [CodeShare]?
    let aircraft: Aircraft?
    let iataFlightServiceType: String?
    let isETOPSFlight: Bool?
    let flightRangeCode: String?
    let operatingAirlineCode: String?
    let operatingAirlineName: String?
    let sourceInternalID, scheduledDepartureDateStnLocal: String?
    let onwardOperatingAirlineCode, onwardOperatingFlightNumber: String?

    enum CodingKeys: String, CodingKey {
        case legNumber, scheduledDateTimeUTC, estimatedDateTimeUTC, actualDepartureStation, actualArrivalStation, actualdatetimeutc, irropsType, opsReason, scheduledArrivalStation, scheduledDepartureStation, codeShares, aircraft, iataFlightServiceType, isETOPSFlight, flightRangeCode, operatingAirlineCode, operatingAirlineName
        case sourceInternalID = "sourceInternalId"
        case scheduledDepartureDateStnLocal, onwardOperatingAirlineCode, onwardOperatingFlightNumber
    }
}

// MARK: - ActualStation
struct ActualStation: Codable {
    let airportCode: String?
    let zuluOffset: Int?
    let gate: Gate?
    let countryCode2Letters: String?
    let countryCode3Letters: String?
}


// MARK: - Gate
struct Gate: Codable {
    let podium, parkingSpot: String?
    let carousel: String?
}

// MARK: - Actualdatetimeutc
struct Actualdatetimeutc: Codable {
    let out, inTime, on, off: String?

    enum CodingKeys: String, CodingKey {
        case out
        case inTime = "in"
        case on, off
    }
}

// MARK: - Aircraft
struct Aircraft: Codable {
    let aircraftRegistration, fleetType, fleetSeries, iataAircraftCode: String?
    let oagFleetCode: String?
    let manufacturer: Manufacturer?
    let scheduleSubFleetEquipmentTypeCode: String?
}

enum Manufacturer: String, Codable {
    case airbus = "AIRBUS"
    case boeing = "BOEING"
}

// MARK: - CodeShare
struct CodeShare: Codable {
    let marketingFlightNumber, marketingAirlineCode: String?
}

// MARK: - EstimatedDateTimeUTC
struct EstimatedDateTimeUTC: Codable {
    let outTime, inTime: String?
    let delayInformation: [DelayInformation]?

    enum CodingKeys: String, CodingKey {
        case outTime = "out"
        case inTime = "in"
        case delayInformation
    }
}

// MARK: - DelayInformation
struct DelayInformation: Codable {
    let code, order, minutes: String?
    let delayInformationDescription: String?
    let reason: String?
    let subDelayInformationList: [DelayInformation]?

    enum CodingKeys: String, CodingKey {
        case code, order, minutes
        case delayInformationDescription = "description"
        case reason, subDelayInformationList
    }
}


// MARK: - ScheduledStation
struct ScheduledStation: Codable {
    let airportCode: String?
}

// MARK: - ScheduledDateTimeUTC
struct ScheduledDateTimeUTC: Codable {
    let outTime, inTime: String?

    enum CodingKeys: String, CodingKey {
        case outTime = "out"
        case inTime = "in"
    }
}


