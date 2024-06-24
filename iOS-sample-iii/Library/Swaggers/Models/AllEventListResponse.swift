//
// AllEventListResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct AllEventListResponse: Codable {

    public var code: Int?
    public var message: String?
    public var data: [HomeEventListResponseData]?

    public init(code: Int?, message: String?, data: [HomeEventListResponseData]?) {
        self.code = code
        self.message = message
        self.data = data
    }


}

