//
// AircraftDetailResponseDataDepartAircraft.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct AircraftDetailResponseDataDepartAircraft: Codable {

    public var iAircraftId: Int?
    public var vAircraftName: String?
    public var vCompanyName: String?
    public var vAircraftType: String?
    public var iNumberOfSeats: Int?
    public var iCruiseSpeed: Int?
    public var vCruiseSpeedUnit: String?
    public var iAircraftLenght: Int?
    public var iCabinWidth: Int?
    public var vLavotary: String?
    public var iRange: Int?
    public var vRangeUnit: String?
    public var iMainRunway: Int?
    public var vMainRunwayUnit: String?
    public var dcPriceForFlight: Double?
    public var dcPricePerSeat: Double?
    public var dcTaxForFlight: Double?
    public var dcTaxPerSeat: Double?

    public init(iAircraftId: Int?, vAircraftName: String?, vCompanyName: String?, vAircraftType: String?, iNumberOfSeats: Int?, iCruiseSpeed: Int?, vCruiseSpeedUnit: String?, iAircraftLenght: Int?, iCabinWidth: Int?, vLavotary: String?, iRange: Int?, vRangeUnit: String?, iMainRunway: Int?, vMainRunwayUnit: String?, dcPriceForFlight: Double?, dcPricePerSeat: Double?, dcTaxForFlight: Double?, dcTaxPerSeat: Double?) {
        self.iAircraftId = iAircraftId
        self.vAircraftName = vAircraftName
        self.vCompanyName = vCompanyName
        self.vAircraftType = vAircraftType
        self.iNumberOfSeats = iNumberOfSeats
        self.iCruiseSpeed = iCruiseSpeed
        self.vCruiseSpeedUnit = vCruiseSpeedUnit
        self.iAircraftLenght = iAircraftLenght
        self.iCabinWidth = iCabinWidth
        self.vLavotary = vLavotary
        self.iRange = iRange
        self.vRangeUnit = vRangeUnit
        self.iMainRunway = iMainRunway
        self.vMainRunwayUnit = vMainRunwayUnit
        self.dcPriceForFlight = dcPriceForFlight
        self.dcPricePerSeat = dcPricePerSeat
        self.dcTaxForFlight = dcTaxForFlight
        self.dcTaxPerSeat = dcTaxPerSeat
    }


}
