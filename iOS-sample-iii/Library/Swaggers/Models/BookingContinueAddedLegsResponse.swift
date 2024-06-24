//
// BookingContinueAddedLegsResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct BookingContinueAddedLegsResponse: Codable {

    public var code: Int?
    public var message: String?
    public var data: BookingContinueResponseData?

    public init(code: Int?, message: String?, data: BookingContinueResponseData?) {
        self.code = code
        self.message = message
        self.data = data
    }


}

