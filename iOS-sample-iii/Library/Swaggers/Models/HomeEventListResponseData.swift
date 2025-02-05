//
// HomeEventListResponseData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct HomeEventListResponseData: Codable {

    public var iEventId: Int?
    public var vEventName: String?
    public var vEventImageThumb: String?
    public var vEventImage: String?
    public var iEventDate: Int?
    public var iEventTime: Int?
    public var vUrl: String?
    public var txShortDesc: String?
    public var txLongDesc: String?

    public init(iEventId: Int?, vEventName: String?, vEventImageThumb: String?, vEventImage: String?, iEventDate: Int?, iEventTime: Int?, vUrl: String?, txShortDesc: String?, txLongDesc: String?) {
        self.iEventId = iEventId
        self.vEventName = vEventName
        self.vEventImageThumb = vEventImageThumb
        self.vEventImage = vEventImage
        self.iEventDate = iEventDate
        self.iEventTime = iEventTime
        self.vUrl = vUrl
        self.txShortDesc = txShortDesc
        self.txLongDesc = txLongDesc
    }


}

