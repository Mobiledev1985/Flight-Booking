//
//  PrivateFlightBookingDetailPresenter.swift
//  AircraftApp
//
//  Created by SOTSYS148 on 26/02/20.
//  Copyright (c) 2020 SOTSYS203. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PrivateFlightBookingDetailPresentationProtocol {
    func callAircraftDeatailRequest(param:Dictionary<String,Any>,inView: UIView)
    func getAircraftDeatailResponse(response: AircraftDetailResponse)
    func callBookingContinueRequest(param:Dictionary<String,Any>,inView:UIView)
    func getBookingContinueResponse(response:BookingContinueResponse)
    func getErrorResponse(error:Error)
}

class PrivateFlightBookingDetailPresenter: PrivateFlightBookingDetailPresentationProtocol {
    weak var viewController: PrivateFlightBookingDetailProtocol?
    var interactor: PrivateFlightBookingDetailInteractorProtocol?
    
    // MARK: Present something
    func callAircraftDeatailRequest(param:Dictionary<String,Any>,inView: UIView) {
        self.interactor?.callAircrafrDetailApi(param: param, inView: inView)
    }
    
    func getAircraftDeatailResponse(response: AircraftDetailResponse) {
        if response.code == APIConstant.ResponseCode.success {
            if response.data != nil {
                self.viewController?.getAircraftDeatailResponse(response: response)
            } else {
                if let view = self.viewController as? UIViewController {
                    let baseDM = BaseModel.init(responseCode: response.code, responseMessage: (response.message)!)
                    view.showAlertView(baseDM)
                }
            }
        } else {
            if let view = self.viewController as? UIViewController {
                let baseDM = BaseModel.init(responseCode: response.code, responseMessage: (response.message)!)
                view.showAlertView(baseDM)
            }
        }
    }
    
    func callBookingContinueRequest(param:Dictionary<String,Any>,inView:UIView) {
        self.interactor?.callBookingContinueApi(param: param, inView: inView)
    }
    
    func getBookingContinueResponse(response:BookingContinueResponse) {
        if response.code == APIConstant.ResponseCode.success {
            if response.data != nil {
//                self.viewController?.getBookingContinueResponse(response: response)
                let objFeed = AddPassengerDetailViewController.instantiateFromStoryboard(.Home)
                objFeed.bookingId = response.data?.iBookingId
                if let view = self.viewController as? UIViewController {
                    view.navigationController?.pushViewController(objFeed, animated: true)
                }
            } else {
                if let view = self.viewController as? UIViewController {
                    let baseDM = BaseModel.init(responseCode: response.code, responseMessage: (response.message)!)
                    view.showAlertView(baseDM)
                }
            }
        } else {
            if let view = self.viewController as? UIViewController {
                let baseDM = BaseModel.init(responseCode: response.code, responseMessage: (response.message)!)
                view.showAlertView(baseDM)
            }
        }
    }
    
    func getErrorResponse(error:Error) {
        self.viewController?.displayAlert(strTitle: APPNAME, strMessage: error.localizedDescription)
    }
}
