//
//  PrivateFlightBookingDetailViewController.swift
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

protocol PrivateFlightBookingDetailProtocol: class {
    func getAircraftDeatailResponse(response:AircraftDetailResponse)
    func getBookingContinueResponse(response:BookingContinueResponse)
    func displayAlert(strTitle : String, strMessage : String)
}

class PrivateFlightBookingDetailViewController: UIViewController, PrivateFlightBookingDetailProtocol {
    
    //----------------------------
    // MARK:- Outlets Declaration-
    //----------------------------

    @IBOutlet weak var btnContinueBackGroundView: UIView!
    @IBOutlet weak var selectSeatsView: UIView!
    @IBOutlet weak var selectAirCraftTypeView: UIView!
    @IBOutlet weak var collectionSelectSeats: UICollectionView!
    @IBOutlet weak var sharedYes: UIButton!
    @IBOutlet weak var sharedNo: UIButton!
    @IBOutlet weak var btnCateringYes: UIButton!
    @IBOutlet weak var btnCateringNo: UIButton!
    @IBOutlet weak var btnCateringReservationYes: UIButton!
    @IBOutlet weak var btnCateringReservationNo: UIButton!
    @IBOutlet weak var swtTAndC: UISwitch!
    @IBOutlet weak var lblAircraftName: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblseats: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDepartureAirportName: UILabel!
    @IBOutlet weak var lblDepartureAirportTitle: UILabel!
    @IBOutlet weak var lblDestinationAirportName: UILabel!
    @IBOutlet weak var lblDestinationAirportTitle: UILabel!
    @IBOutlet weak var lblDepartureDate: UILabel!
    @IBOutlet weak var lblDepartureTime: UILabel!
    @IBOutlet weak var lblCruiseSpeed: UILabel!
    @IBOutlet weak var lblAircraftlength: UILabel!
    @IBOutlet weak var lblCabinWidth: UILabel!
    @IBOutlet weak var lblLavatory: UILabel!
    @IBOutlet weak var lblRange: UILabel!
    @IBOutlet weak var lblMainRunWay: UILabel!
    @IBOutlet weak var lblPriceForFlight: UILabel!
    @IBOutlet weak var lblTaxes: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    //------------------------------
    // MARK:- Variables Declaration-
    //------------------------------
    var totalPrice:Double? = 1010
    var numberOfSeats:Int?
    var departureDeail: DepartureDetail?
    var destinationDetail: DestinationDetail?
    var selectedAircraftsDetail: SearchAircraftResponseDataDepartAircrafts?
    var aircraftDetailResponse: AircraftDetailResponse?
    var aircraftDetailResponseData: AircraftDetailResponseData?
    var arrSeats: [SelectSeatsModal] = [
        SelectSeatsModal.init(seatNumber: 1, isSelected: true),
        SelectSeatsModal.init(seatNumber: 2, isSelected: true),
        SelectSeatsModal.init(seatNumber: 3, isSelected: true),
        SelectSeatsModal.init(seatNumber: 4, isSelected: false),
        SelectSeatsModal.init(seatNumber: 5, isSelected: false),
        SelectSeatsModal.init(seatNumber: 6, isSelected: false),
        SelectSeatsModal.init(seatNumber: 7, isSelected: false),
        SelectSeatsModal.init(seatNumber: 8, isSelected: false),
        SelectSeatsModal.init(seatNumber: 9, isSelected: false),
        SelectSeatsModal.init(seatNumber: 10, isSelected: false),
        SelectSeatsModal.init(seatNumber: 1, isSelected: false)]
    var bookingType: enBookingType!
    
    //var interactor : PrivateFlightBookingDetailInteractorProtocol?
    var presenter : PrivateFlightBookingDetailPresentationProtocol?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = PrivateFlightBookingDetailInteractor()
        let presenter = PrivateFlightBookingDetailPresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenter = presenter
        //viewController.interactor = interactor
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewController = viewController
        presenter.interactor = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenter = presenter
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpNavigationBar()
        prePareUI()
        self.applyShadow(view: btnContinueBackGroundView, shadowColor: blueShadowColor!, radius: btnContinueBackGroundView.height * 0.5)
    }
       
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    //----------------
    // MARK:- Actions-
    //----------------
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.popVC()
    }

    @IBAction func btnContinueAction(_ sender: UIButton){
        if NetworkReachabilityManager.init()!.isReachable {
            let param = RequestParameter.init().bookingContinueParam(iTripType: (BookingModel.bookingSharedDM?.iTripType?.string)!, iTripBookingType: BookingModel.bookingSharedDM!.iTripBookingType!, iDepartAircraftId: BookingModel.bookingSharedDM!.selectedAircaft!.iAircraftTypeId!, iDepartureId: (BookingModel.bookingSharedDM?.departureAirport?.iAirportId)!, iDestinationId: (BookingModel.bookingSharedDM?.destinationAirport?.iAirportId)!, iDepartureDate: 1585651319, iDepartureTime: 1582628400, dcTotalPrice: totalPrice!, iNumberOfSeats: numberOfSeats!)
            self.presenter?.callBookingContinueRequest(param: param, inView: self.view)
        } else {
            self.showAlert(title: APPNAME, message: NETWORKALERT)
        }
//        let objVc = AddPassengerDetailViewController.instantiateFromStoryboard(.Home)
//        self.navigationController?.pushViewController(objVc, animated: true)
    }
    
    @IBAction func didSelectAirCraftType(_ sender: UIButton) {
        if sender.tag == sharedYes.tag {
            sharedYes.isSelected = true
            sharedNo.isSelected = false
            selectSeatsView.isHidden = false
            selectAirCraftTypeView.isHidden = true
        } else {
            sharedYes.isSelected = false
            sharedNo.isSelected = true            
        }
    }
    
    @IBAction func didSelectCatering(_ sender: UIButton) {
        if sender.tag == btnCateringYes.tag {
            btnCateringYes.isSelected = true
            btnCateringNo.isSelected = false
        } else {
            btnCateringYes.isSelected = false
            btnCateringNo.isSelected = true
        }
    }
    
    @IBAction func didSelectCateringReservation(_ sender: UIButton) {
        if sender.tag == btnCateringReservationYes.tag {
            btnCateringReservationYes.isSelected = true
            btnCateringReservationNo.isSelected = false
        } else {
            btnCateringReservationYes.isSelected = false
            btnCateringReservationNo.isSelected = true
        }
    }
    
    //-----------------------
    // MARK:- Custom Methods-
    //-----------------------
    
    func setUpNavigationBar(){
        displayNavigationBar(isLargeTitleVisible: false, titlecolor: .white)
        self.title = "Booking"
        self.setLeftBarButtonTitle(imageName: #imageLiteral(resourceName: "icn_back_white"), selector: #selector(btnBackAction(_:)  ))
    }
    
    func prePareUI() {
        if NetworkReachabilityManager.init()!.isReachable {
            let param = RequestParameter.init().AirfraftDetailParam(iTripType: (BookingModel.bookingSharedDM?.iTripType?.string)!, iTripBookingType: BookingModel.bookingSharedDM!.iTripBookingType!, iDepartAircraftId: BookingModel.bookingSharedDM!.selectedAircaft!.iAircraftTypeId!, iDepartureId: (BookingModel.bookingSharedDM?.departureAirport?.iAirportId)!, iDestinationId: (BookingModel.bookingSharedDM?.destinationAirport?.iAirportId)!, iDepartureDate: 1585651319, iDepartureTime: 1582628400)
            self.presenter?.callAircraftDeatailRequest(param: param, inView: self.view)
        } else {
            self.showAlert(title: APPNAME, message: NETWORKALERT)
        }
        swtTAndC.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
       if bookingType == enBookingType.privateBooking {
           selectSeatsView.isHidden = true
       } else {
           selectAirCraftTypeView.isHidden = true
       }
    }
    
    func fillInfo() {
        self.lblAircraftName.text = aircraftDetailResponseData?.departAircraft?.vAircraftName
        self.lblCompanyName.text = aircraftDetailResponseData?.departAircraft?.vCompanyName
        self.lblseats.text = (aircraftDetailResponseData?.departAircraft?.iNumberOfSeats?.string)! + " seats"
        self.lblSpeed.text = "100Mph"
        self.lblDepartureAirportName.text = departureDeail?.vAirportName
        self.lblDepartureAirportTitle.text = departureDeail?.vId
        self.lblDestinationAirportName.text = destinationDetail?.vAirportName
        self.lblDestinationAirportTitle.text = destinationDetail?.vId
        self.lblDepartureDate.text = dateStringFromUnixTime(unixTime: aircraftDetailResponseData!.iDepartureDate!)
        self.lblDepartureTime.text = timeStringFromUnixTime(unixTime: aircraftDetailResponseData!.iDepartureTime!)
        self.lblCruiseSpeed.text = aircraftDetailResponseData?.departAircraft?.iCruiseSpeed?.string
        self.lblAircraftlength.text = aircraftDetailResponseData?.departAircraft?.iAircraftLenght?.string
        self.lblCabinWidth.text = aircraftDetailResponseData?.departAircraft?.iCabinWidth?.string
        self.lblLavatory.text = aircraftDetailResponseData?.departAircraft?.vLavotary!
        self.lblRange.text = aircraftDetailResponseData?.departAircraft?.iRange?.string
        let mainRunway = String(describing: aircraftDetailResponseData!.departAircraft!.iMainRunway) + (aircraftDetailResponseData?.departAircraft!.vMainRunwayUnit)!
        print(mainRunway)
//        self.lblMainRunWay.text = aircraftDetailResponseData?.departAircraft?.iMainRunway?.string + aircraftDetailResponseData?.departAircraft?.vMainRunwayUnit
        self.lblPriceForFlight.text = "$" + (aircraftDetailResponseData?.departAircraft?.dcPriceForFlight?.string)!
        self.lblTaxes.text = "$" + (aircraftDetailResponseData?.departAircraft?.dcTaxForFlight?.string)!
        self.lblTotal.text = "$" + totalPrice!.string!
    }
    
    func getAircraftDeatailResponse(response:AircraftDetailResponse) {
        self.aircraftDetailResponse = response
        self.aircraftDetailResponseData = response.data
        self.departureDeail = response.data?.departureDetail
        self.destinationDetail = response.data?.destinationDetail
        self.numberOfSeats = aircraftDetailResponseData?.departAircraft?.iNumberOfSeats
        fillInfo()
    }
    
    func getBookingContinueResponse(response:BookingContinueResponse) {
        
    }
    
    func displayAlert(strTitle : String, strMessage : String) {
        //nameTextField.text = viewModel.name
        self.showAlert(title: strTitle, message: strMessage)
    }
}

//-----------------------------------------------------
// MARK:- CollectionView DataSource & Delegate Methods-
//-----------------------------------------------------
extension PrivateFlightBookingDetailViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSeats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectSeatsCollectionViewCell", for: indexPath) as! SelectSeatsCollectionViewCell
        cell.btnSeats.isSelected = arrSeats[indexPath.row].isSelected!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrSeats[indexPath.row].isSelected?.toggle()
        collectionSelectSeats.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40 , height: 40 )
    }
}
