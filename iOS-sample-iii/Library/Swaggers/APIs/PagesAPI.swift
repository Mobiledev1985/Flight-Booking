//
// PagesAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class PagesAPI {
    /**
     static page
     
     - parameter vPageSlug: (form) vPageSlug 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func staticPagePost(vPageSlug: String, completion: @escaping ((_ data: StaticPageResponse?,_ error: Error?) -> Void)) {
        staticPagePostWithRequestBuilder(vPageSlug: vPageSlug).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     static page
     - POST /static_page
     - examples: [{contentType=application/json, example={
  "code" : 200,
  "message" : "Page information",
  "data" : {
    "iPageId" : 1,
    "vPageName" : "About us",
    "vPageSlug" : "about_us",
    "txDescription" : "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?",
    "vMetaTitle" : "About us",
    "vMetaKeyWord" : "About us",
    "txMetaDescription" : "About us"
  }
}}]
     
     - parameter vPageSlug: (form) vPageSlug 

     - returns: RequestBuilder<StaticPageResponse> 
     */
    open class func staticPagePostWithRequestBuilder(vPageSlug: String) -> RequestBuilder<StaticPageResponse> {
        let path = "/static_page"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "vPageSlug": vPageSlug
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<StaticPageResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}