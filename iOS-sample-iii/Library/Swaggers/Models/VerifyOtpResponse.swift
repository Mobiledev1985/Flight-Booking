//
// VerifyOtpResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct VerifyOtpResponse: Codable {

    public var code: Int?
    public var message: String?
    public var data: LoginWithGoogleResponseData?

    public init(code: Int?, message: String?, data: LoginWithGoogleResponseData?) {
        self.code = code
        self.message = message
        self.data = data
    }


}

