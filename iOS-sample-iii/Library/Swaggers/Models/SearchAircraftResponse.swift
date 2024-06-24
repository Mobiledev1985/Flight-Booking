//
// SearchAircraftResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SearchAircraftResponse: Codable {

    public var code: Int?
    public var message: String?
    public var data: SearchAircraftResponseData?

    public init(code: Int?, message: String?, data: SearchAircraftResponseData?) {
        self.code = code
        self.message = message
        self.data = data
    }


}

