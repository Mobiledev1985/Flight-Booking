//
// UpcomingFlightsResponseData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct UpcomingFlightsResponseData: Codable {

    public var iTripId: Int?
    public var iBookingId: Int?
    public var iTripType: Int?
    public var iTripBookingType: Int?
    public var iDepartureDate: Int?
    public var iDepartureTime: Int?
    public var iAircraftId: Int?
    public var vAircraftName: String?
    public var vAircraftType: String?
    public var vQrCode: String?
    public var dcTotalPrice: Double?
    public var iCreatedAt: Int?
    public var dcPriceForFlight: Double?
    public var dcPricePerSeat: Double?
    public var iAircraftImageId: Int?
    public var vAircraftImageName: String?
    public var vAircraftImageThumb: String?
    public var tiStatus: String?
    public var departureDetail: DepartureDetail?
    public var destinationDetail: DestinationDetail?
    public var passengersDetail: [BoardingPassListResponsePassengersDetail]?

    public init(iTripId: Int?, iBookingId: Int?, iTripType: Int?, iTripBookingType: Int?, iDepartureDate: Int?, iDepartureTime: Int?, iAircraftId: Int?, vAircraftName: String?, vAircraftType: String?, vQrCode: String?, dcTotalPrice: Double?, iCreatedAt: Int?, dcPriceForFlight: Double?, dcPricePerSeat: Double?, iAircraftImageId: Int?, vAircraftImageName: String?, vAircraftImageThumb: String?, tiStatus: String?, departureDetail: DepartureDetail?, destinationDetail: DestinationDetail?, passengersDetail: [BoardingPassListResponsePassengersDetail]?) {
        self.iTripId = iTripId
        self.iBookingId = iBookingId
        self.iTripType = iTripType
        self.iTripBookingType = iTripBookingType
        self.iDepartureDate = iDepartureDate
        self.iDepartureTime = iDepartureTime
        self.iAircraftId = iAircraftId
        self.vAircraftName = vAircraftName
        self.vAircraftType = vAircraftType
        self.vQrCode = vQrCode
        self.dcTotalPrice = dcTotalPrice
        self.iCreatedAt = iCreatedAt
        self.dcPriceForFlight = dcPriceForFlight
        self.dcPricePerSeat = dcPricePerSeat
        self.iAircraftImageId = iAircraftImageId
        self.vAircraftImageName = vAircraftImageName
        self.vAircraftImageThumb = vAircraftImageThumb
        self.tiStatus = tiStatus
        self.departureDetail = departureDetail
        self.destinationDetail = destinationDetail
        self.passengersDetail = passengersDetail
    }


}

