//
// UserAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class UserAPI {
    /**
     Change Password
     
     - parameter cpassword: (form) Current Password 
     - parameter password: (form) New Password 
     - parameter passwordConfirmation: (form) Confirm Password 
     - parameter accessToken: (header)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func changePasswordPost(cpassword: String, password: String, passwordConfirmation: String, accessToken: String, completion: @escaping ((_ data: SuccessResponse?,_ error: Error?) -> Void)) {
        changePasswordPostWithRequestBuilder(cpassword: cpassword, password: password, passwordConfirmation: passwordConfirmation, accessToken: accessToken).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Change Password
     - POST /change_password
     - examples: [{contentType=application/json, example={
  "code" : 200,
  "message" : "Password successfully changed."
}}]
     
     - parameter cpassword: (form) Current Password 
     - parameter password: (form) New Password 
     - parameter passwordConfirmation: (form) Confirm Password 
     - parameter accessToken: (header)  

     - returns: RequestBuilder<SuccessResponse> 
     */
    open class func changePasswordPostWithRequestBuilder(cpassword: String, password: String, passwordConfirmation: String, accessToken: String) -> RequestBuilder<SuccessResponse> {
        let path = "/change_password"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "cpassword": cpassword,
            "password": password,
            "password_confirmation": passwordConfirmation
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        let url = URLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
            "AccessToken": accessToken
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<SuccessResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Update User Profile
     
     - parameter accessToken: (header)  
     - parameter vUserName: (form) Full Name (optional, default to )
     - parameter vPhone: (form) Phone (optional, default to )
     - parameter vEmail: (form) Email address (optional, default to )
     - parameter vProfileImage: (form) Profile Image (optional, default to )
     - parameter vIdProof: (form) ID Proof (optional, default to )
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateProfilePost(accessToken: String, vUserName: String? = nil, vPhone: String? = nil, vEmail: String? = nil, vProfileImage: String? = nil, vIdProof: String? = nil, completion: @escaping ((_ data: UpdateProfileResponse?,_ error: Error?) -> Void)) {
        updateProfilePostWithRequestBuilder(accessToken: accessToken, vUserName: vUserName, vPhone: vPhone, vEmail: vEmail, vProfileImage: vProfileImage, vIdProof: vIdProof).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Update User Profile
     - POST /update_profile
     - examples: [{contentType=application/json, example={
  "code" : 200,
  "message" : "User information",
  "data" : {
    "iUserId" : 37,
    "vUserName" : "aaa",
    "vEmail" : "aa11@aaa.com",
    "vPhone" : "1111111",
    "vProfileImage" : "profile-image.jpeg",
    "tiUserType" : 0,
    "tiIsSocialLogin" : 0,
    "tiIsGuestUser" : 0,
    "tiIsActive" : 1,
    "accessToken" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjEyMjg5YjE2MGY4NmFjYTkwZjVmZDVlYjE3NTQ4M2Y4MmU4ZTUzYmIxZjI5NzBiZDI0OTkyMGJjYjQwYTA5MGFkZWMxOGM3YzVhNjE5NTY0In0.eyJhdWQiOiIxIiwianRpIjoiMTIyODliMTYwZjg2YWNhOTBmNWZkNWViMTc1NDgzZjgyZThlNTNiYjFmMjk3MGJkMjQ5OTIwYmNiNDBhMDkwYWRlYzE4YzdjNWE2MTk1NjQiLCJpYXQiOjE1ODIwMTQxMDQsIm5iZiI6MTU4MjAxNDEwNCwiZXhwIjoxNjEzNjM2NTAzLCJzdWIiOiIzNyIsInNjb3BlcyI6W119.mquTwMx1OzHk_u3vgiuvlKvf895hYhNA5FYpuzWB1f1-7BZkI0czaBO2nCriX7jyj1xhRQnW7XF5Vhh7cIXvHQGoDZCZY9MMFDFMcx7nr0gfr_qrmBeprnJeM_wVd39_ruqZ1eA9tAYaL3k4fE4puqb_JMy7r2feZDlQEqv3eBDj333Wq7dns364i8K4WEc5XVrs-GYDOOEExlYUCo1_LplXJ-3tzu5A-2CLSS_LQdHnDEboha1dbWvNYSW4pLSAuyF4oAMwiWIRA0QHyN2Ml1a6lX7lzE6plGRYTBhNg9n2apvk0OamDOTXLF5jtu4LncuandgTkNyydAYoyLsVgBUWsHz8CAR4rlIYRljZ4Ek4oe4BmUlsjNxNJa1AhW_enZowPUmgi1_rSli8ncZoxshjwP27NsygKf5cj8-2rSD2jFXy3AF1u2fb5H8GkjsePj-nant-c1e1W2cI5BD_BYQMJPeFfCv1L4hUuQUkuLypPxEjnAbuLGDEcZioVXjZ2RSNZUfQZ0bzbf2VRd-PsoDPIr6snqRfZpF5or2ue4ymaLUklfhWBCNGMa9uNPjlD7JChuI4EsHUMQXMkNN_LbBRdOJBvkGcg4F4b0QOVPkez3BbO_YNuTkkI3mgc0i8sPC4cNunMjYZuMPGk0spEDYUbXZV8Cz7xdpzBqvaQ1Q"
  }
}}]
     
     - parameter accessToken: (header)  
     - parameter vUserName: (form) Full Name (optional, default to )
     - parameter vPhone: (form) Phone (optional, default to )
     - parameter vEmail: (form) Email address (optional, default to )
     - parameter vProfileImage: (form) Profile Image (optional, default to )
     - parameter vIdProof: (form) ID Proof (optional, default to )

     - returns: RequestBuilder<UpdateProfileResponse> 
     */
    open class func updateProfilePostWithRequestBuilder(accessToken: String, vUserName: String? = nil, vPhone: String? = nil, vEmail: String? = nil, vProfileImage: String? = nil, vIdProof: String? = nil) -> RequestBuilder<UpdateProfileResponse> {
        let path = "/update_profile"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "vUserName": vUserName,
            "vPhone": vPhone,
            "vEmail": vEmail,
            "vProfileImage": vProfileImage,
            "vIdProof": vIdProof
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        let url = URLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
            "AccessToken": accessToken
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<UpdateProfileResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     User Info
     
     - parameter accessToken: (header)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func userInfoPost(accessToken: String, completion: @escaping ((_ data: UserInformationResponse?,_ error: Error?) -> Void)) {
        userInfoPostWithRequestBuilder(accessToken: accessToken).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     User Info
     - POST /user_info
     - examples: [{contentType=application/json, example={
  "code" : 200,
  "message" : "User information",
  "data" : {
    "iUserId" : 1,
    "vUserName" : "victoria hale",
    "vEmail" : "victoriahale.cis@gmail.com",
    "vPhone" : "2222222",
    "tiUserType" : 1,
    "vIdProof" : "/tmp/phpkUr5tL",
    "tiSocialLogin" : 0,
    "tiIsGuestUser" : 0,
    "tiIsActive" : 1,
    "accessToken" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImE4ZGMxNTE5OWMzM2IyY2ZjODc5MWQ2MGExZGY0ZGM0NDY2M2M2N2NmODIyMWIxN2RhNGU2MGU4YTMyNTEwYTEyY2E3NjZkMjhmMzc0Y2MwIn0.eyJhdWQiOiIxIiwianRpIjoiYThkYzE1MTk5YzMzYjJjZmM4NzkxZDYwYTFkZjRkYzQ0NjYzYzY3Y2Y4MjIxYjE3ZGE0ZTYwZThhMzI1MTBhMTJjYTc2NmQyOGYzNzRjYzAiLCJpYXQiOjE1ODIxMTI2NTYsIm5iZiI6MTU4MjExMjY1NiwiZXhwIjoxNjEzNzM1MDU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.P-2xDuA0TkT-tW_J0oIS5HloEKvtyYgUvP6VJOSl9HWEXvV6UsEk3vvC1PftlbJeM_7vnzkvm8HeMHzU1q3PEJwUv54xHZ9E6OKctJG3u1K7lxyMZfsjgR1lAM91V5gSuN-6Goh7QvtvKg2q-2NKmOsthOkZBUKrhXiyXWAUf4gf4VGkp-vUz_3F_ehSb8GA2hZHl-uf45NULNNTEayeueV1oA872RYq_cwtChS0rqmsESsNNZ6qZUhPV3kyapgRzJpNo_5nU2-JIkKDwmEnI--709W84I1lxP1cCo2VLr7hphCvutQ0ARbK1HjUWsbMvXnJ1d8tF7neEWQv4sxNGkwj7yunu2ExmEkQ7l4nhYHLvdc16GKt8-KfaZEoNVtLQWAx_SwKFFZ30rYsTFg5beGDqmcJKkk-GmioG2EKoEilEc26anhhCJXhiX_prkpSM_xJokClwo4OFOJOJ_TOG215MFT0LLzcQ1QMuEZ1b7S9zyiAbwe-S8MsmgNBCG2WKe5WAyTK8EyXJBNq9sTIrqIpAWLTIS5v4PAnAL9COL9wK9da4TQzuuTPlPMzodE-fW6Qlt-abwNDShsu4_z435Eo-lED7_BSht5COReeJBhcqMzfHXulpCQf1ReIxz_bR5w9GcnKgFhSmXVry0fuVFoGmKcopdbbQ0lW0sezu-Q"
  }
}}]
     
     - parameter accessToken: (header)  

     - returns: RequestBuilder<UserInformationResponse> 
     */
    open class func userInfoPostWithRequestBuilder(accessToken: String) -> RequestBuilder<UserInformationResponse> {
        let path = "/user_info"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
            "AccessToken": accessToken
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<UserInformationResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

}