//
// AddPassengerResponseData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct AddPassengerResponseData: Codable {

    public var iPassengerId: Int?
    public var iBookingId: Int?
    public var vPassengerName: String?
    public var vPassengerId: String?
    public var dPassengerDob: String?

    public init(iPassengerId: Int?, iBookingId: Int?, vPassengerName: String?, vPassengerId: String?, dPassengerDob: String?) {
        self.iPassengerId = iPassengerId
        self.iBookingId = iBookingId
        self.vPassengerName = vPassengerName
        self.vPassengerId = vPassengerId
        self.dPassengerDob = dPassengerDob
    }


}

