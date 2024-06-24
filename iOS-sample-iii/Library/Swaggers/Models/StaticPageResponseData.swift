//
// StaticPageResponseData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct StaticPageResponseData: Codable {

    public var iPageId: Int?
    public var vPageName: String?
    public var vPageSlug: String?
    public var vEventImage: String?
    public var txDescription: String?
    public var vMetaTitle: String?
    public var vMetaKeyWord: String?
    public var txMetaDescription: String?

    public init(iPageId: Int?, vPageName: String?, vPageSlug: String?, vEventImage: String?, txDescription: String?, vMetaTitle: String?, vMetaKeyWord: String?, txMetaDescription: String?) {
        self.iPageId = iPageId
        self.vPageName = vPageName
        self.vPageSlug = vPageSlug
        self.vEventImage = vEventImage
        self.txDescription = txDescription
        self.vMetaTitle = vMetaTitle
        self.vMetaKeyWord = vMetaKeyWord
        self.txMetaDescription = txMetaDescription
    }


}
