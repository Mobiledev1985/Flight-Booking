//
// SeatsInformationResponseDataPassengersDetail.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SeatsInformationResponseDataPassengersDetail: Codable {

    public var seatsBookedByme: [BoardingPassListResponsePassengersDetail]?
    public var otherPassenger: [BoardingPassListResponsePassengersDetail]?

    public init(seatsBookedByme: [BoardingPassListResponsePassengersDetail]?, otherPassenger: [BoardingPassListResponsePassengersDetail]?) {
        self.seatsBookedByme = seatsBookedByme
        self.otherPassenger = otherPassenger
    }


}

