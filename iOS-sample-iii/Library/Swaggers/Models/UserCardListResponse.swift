//
// UserCardListResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct UserCardListResponse: Codable {

    public var code: Int?
    public var message: String?
    public var data: [UserCardResponse]?

    public init(code: Int?, message: String?, data: [UserCardResponse]?) {
        self.code = code
        self.message = message
        self.data = data
    }


}

