//
//  BookFlightViewController.swift
//  AircraftApp
//
//  Created by SOTSYS148 on 18/02/20.
//  Copyright (c) 2020 SOTSYS203. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BookFlightProtocol: class {
    func getAircraftTypeResponse(response: AircraftTypesListResponse)
    func displayAlert(strTitle : String, strMessage : String)
}

class BookFlightViewController: UIViewController, BookFlightProtocol {
    
    //----------------------------
    // MARK:- Outlets Declaration
    //----------------------------
    
    @IBOutlet weak var searchBtnBackgroundView: UIView!
    @IBOutlet weak var tblBookFlight: UITableView!
    @IBOutlet weak var btnOneWay: UIButton!
    @IBOutlet weak var btnRoundTrip: UIButton!
    @IBOutlet var addLegFooterView: UIView!
    
    //------------------------------
    // MARK:- Variables Declaration
    //------------------------------
    
    lazy var txtCompare = UITextField()
    lazy var btnPrivate = UIButton()
    lazy var btnShared = UIButton()
    var arrOfRow : [Int] = [0]
    var datePicker : UIDatePicker!
    var selectedDepartureAirport: [AirportListResponseData]?
    var selectedDestinationAirport: [AirportListResponseData]?
    var aircraftTypeResponse: AircraftTypesListResponse?
    var arrAircraftTypeList =  [String]()
    
    //var interactor : BookFlightInteractorProtocol?
    var presenter : BookFlightPresentationProtocol?
    
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
        let interactor = BookFlightInteractor()
        let presenter = BookFlightPresenter()
        
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
        if NetworkReachabilityManager.init()!.isReachable {
//            self.presenter?.callAircraftTypelistRequest(inView:self.view)
        } else {
            self.showAlert(title: APPNAME, message: NETWORKALERT)
        }
         tblBookFlight.register(UINib(nibName: "BookFlightPrivateTableViewCell", bundle: nil), forCellReuseIdentifier: "BookFlightPrivateTableViewCell")
        prePareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    //----------------
    // MARK:- Actions -
    //----------------
    
    @IBAction func oneWayOrRoundTrip(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            btnOneWay.borderWidth = 1.0
            btnOneWay.borderColor = .white
            btnRoundTrip.borderWidth = 0.0
            BookingModel.bookingSharedDM?.iTripType = 0
        default:
            btnRoundTrip.borderWidth = 1.0
            btnRoundTrip.borderColor = .white
            btnOneWay.borderWidth = 0.0
            BookingModel.bookingSharedDM?.iTripType = 1
        }
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        if BookingModel.bookingSharedDM?.isSourceSelect == true && BookingModel.bookingSharedDM?.isDestinationSelect == true {
            let objVc = FlightListViewController.instantiateFromStoryboard(.BookFlight)
            if btnShared.isSelected {
                objVc.bookingType = .sharedBooking
            } else {
                objVc.bookingType = .privateBooking
            }
            objVc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(objVc, animated: true)
        } else {
            self.showAlert(title: APPNAME, message: "Please select source And destination")
        }
        
    }
    
    @objc func didTapToSelectPickupLocation() {
        let objVc = SelectLocationViewController.instantiateFromStoryboard(.BookFlight)
        objVc.strNavtitle = "Select Pickup"
        objVc.hidesBottomBarWhenPushed = true
        objVc.completion = { [weak self] (data) in
            if let data: AirportListResponseData = data {
                self?.selectedDepartureAirport?.append(data)
                BookingModel.bookingSharedDM?.departureAirport = data
                BookingModel.bookingSharedDM?.isSourceSelect = true
                self!.tblBookFlight.reloadData()
            }
        }
        pushVC(objVc)
    }
    
    @objc func didTapToSelectDropOffLocation() {
        let objVc = SelectLocationViewController.instantiateFromStoryboard(.BookFlight)
        objVc.strNavtitle = "Select Destination"
        objVc.hidesBottomBarWhenPushed = true
        objVc.completion = { [weak self] (data) in
            if let data: AirportListResponseData = data {
                self?.selectedDestinationAirport?.append(data)
                BookingModel.bookingSharedDM?.destinationAirport = data
                BookingModel.bookingSharedDM?.isDestinationSelect = true
                self!.tblBookFlight.reloadData()
            }
        }
        pushVC(objVc)
    }
    
    @IBAction func didTapToAddLeg() {
        arrOfRow.append(arrOfRow.count)
        UIView.performWithoutAnimation {
            self.tblBookFlight.beginUpdates()
            self.tblBookFlight.insertRows(at: [IndexPath(row: self.arrOfRow.count - 1 , section: 0)], with: .none)
            self.tblBookFlight.endUpdates()
        }
    }
    
    @objc func handleCancelMethod(sender:UIButton){
//        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tblBookFlight)
//        let indexPath = self.tblBookFlight.indexPathForRow(at: buttonPosition)
//        if let indexpath = indexPath{
//            arrOfRow.remove(at: indexpath.row)
//            let deletedIndexPath = IndexPath(row: indexpath.row, section: 0)
//            tblBookFlight.beginUpdates()
//            tblBookFlight.deleteRows(at: [deletedIndexPath], with: .automatic)
//            tblBookFlight.endUpdates()
//        }
        print("handleCancelMethod",sender.tag)
        arrOfRow.remove(at: sender.tag)
        tblBookFlight.reloadData()
        tblBookFlight.layoutIfNeeded()
        print(arrOfRow)
    }
    
    @IBAction func didSelectAirCraftType(_ sender: UIButton) {
        if sender.tag == btnPrivate.tag {
            btnPrivate.isSelected = true
            btnShared.isSelected = false
            BookingModel.bookingSharedDM?.iTripBookingType = "0"
            tblBookFlight.tableFooterView = addLegFooterView
        } else {
            btnPrivate.isSelected = false
            btnShared.isSelected = true
            BookingModel.bookingSharedDM?.iTripBookingType = "1"
            tblBookFlight.tableFooterView = nil
        }
    }
    
    //-----------------------
    // MARK:- Custom Methods -
    //-----------------------
    
    func prePareUI(){
        
        BookingModel.bookingSharedDM = BookingModel.init(title: "", iTripType: 0, iDepartureTime: 1582628400, iDepartureDate: 1585651319, iReturnDate: 0, iReturnTime: 0, iTripBookingType: "0", isSourceSelect: false, isDestinationSelect: false, bookingParentId: 0, returnAircraftTypeId: 0, iBookingId: 0, date: "", time: "", selectedAircaft: AircraftTypesListResponseData.init(iAircraftTypeId: 1, vAircraftType: ""), departureAirport: AirportListResponseData.init(iAirportId: 1, vId: "SAN", vAirportName: "Departure", vZipcode: "", vCity: ""), destinationAirport: AirportListResponseData.init(iAirportId: 2, vId: "SAN", vAirportName: "Destination", vZipcode: "", vCity: ""))
        tblBookFlight.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        self.applyShadow(view: searchBtnBackgroundView, shadowColor: blueShadowColor!, radius: searchBtnBackgroundView.height * 0.5)
        cornerRadius(btn: btnOneWay)
        btnOneWay.borderWidth = 1.0
        btnOneWay.borderColor = .white
        cornerRadius(btn: btnRoundTrip)
        tblBookFlight.tableFooterView = addLegFooterView
    }
    
    func cornerRadius(btn:UIButton) {
        btn.cornerRadius = btn.frame.height * 0.5
        btn.clipsToBounds = true
    }
    
    func getAircraftTypeResponse(response: AircraftTypesListResponse) {
        self.aircraftTypeResponse = response
        for i in 0..<response.data!.count {
            self.arrAircraftTypeList.append(response.data![i].vAircraftType!)
        }
        tblBookFlight.reloadData()
    }
    
    func displayAlert(strTitle : String, strMessage : String) {
        //nameTextField.text = viewModel.name
        self.showAlert(title: strTitle, message: strMessage)
    }
}

//------------------------------------------------
// MARK:- TableView DataSource & Delegate Methods -
//------------------------------------------------

extension BookFlightViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrOfRow.isEmpty {
            return 0
        } else {
            return arrOfRow.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookFlightPrivateTableViewCell") as! BookFlightPrivateTableViewCell
        
        let pickup = UITapGestureRecognizer(target: self, action: #selector(didTapToSelectPickupLocation))
        let destination = UITapGestureRecognizer(target: self, action: #selector(didTapToSelectDropOffLocation))
        cell.picUpView.addGestureRecognizer(pickup)
        cell.destinationView.addGestureRecognizer(destination)
        cell.txtSelectAirCraft.optionArray = arrAircraftTypeList ?? ["Aircraft 1","Aircraft 2","Aircraft 3","Aircraft 4","Aircraft 5"]
        cell.txtSelectAirCraft.didSelect { (txt, int, int1) in
            BookingModel.bookingSharedDM?.selectedAircaft = self.aircraftTypeResponse?.data![int]
            print(txt)
        }
        cell.txtSelectAirCraft.isSearchEnable = false
        cell.btnCancel.tag = indexPath.row
        cell.btnCancel.addTarget(self, action: #selector(handleCancelMethod(sender:)), for: .touchUpInside)
        if indexPath.row == 0 {
            cell.btnCancel.isHidden = true
        } else {
            cell.btnCancel.isHidden = false
        }
        cell.lblDepartureAirportTitle.text = BookingModel.bookingSharedDM?.departureAirport?.vId
        cell.lblDepartureAirportName.text = BookingModel.bookingSharedDM?.departureAirport?.vAirportName
        cell.lblDestinationAirportTitle.text = BookingModel.bookingSharedDM?.destinationAirport?.vId
        cell.lblDestinationAirportName.text = BookingModel.bookingSharedDM?.destinationAirport?.vAirportName
        
        self.applyShadow(view: cell.backGroundShadowView, shadowColor: blackShadowColor!, radius: 13.0)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 313
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if arrOfRow.count > 1 {
            return UIView()
        }
        let headerView =  UIView.init(frame: CGRect.init(x: 0, y: 0, width: tblBookFlight.frame.width, height: 80))

        // SelectTrip type Label
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: tblBookFlight.frame.width - 40, height: 20))
        label.font = setFont(fontname: .SegoeUISemibold,with: 14.0)
        label.text = "Select Trip Type"
        headerView.addSubview(label)

        let btnView = UIView.init(frame: CGRect.init(x: 20, y: label.bottom + 5 , width: tblBookFlight.frame.width - 40, height: 30))

        // Private Booking Button
        let btnPrivatBooking = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: btnView.width / 2, height: 30))
        btnPrivatBooking.setImage(#imageLiteral(resourceName: "icn_radio_btn"), for: .normal)
        btnPrivatBooking.setImage(#imageLiteral(resourceName: "icn_radio_active"), for: .selected)
        btnPrivatBooking.setTitleColor(.black, for: .normal)
        btnPrivatBooking.titleLabel?.font = setFont(fontname: .SegoeUISemibold,with: 14.0)
        btnPrivatBooking.titleLabel?.adjustsFontSizeToFitWidth = true
        btnPrivatBooking.isSelected = true
        btnPrivatBooking.setTitle("Private booking", for: .normal)
        btnPrivatBooking.tag = 0
        btnPrivatBooking.addTarget(self, action: #selector(didSelectAirCraftType(_:)), for: .touchUpInside)
        btnPrivatBooking.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btnPrivatBooking.contentHorizontalAlignment = .left
        btnView.addSubview(btnPrivatBooking)

        // Shared Booking Button
        let btnSharedBooking = UIButton.init(frame: CGRect.init(x: btnPrivatBooking.frame.size.width, y: 0, width: btnView.width / 2, height: 30))
        btnSharedBooking.setImage(#imageLiteral(resourceName: "icn_radio_btn"), for: .normal)
        btnSharedBooking.setImage(#imageLiteral(resourceName: "icn_radio_active"), for: .selected)
        btnSharedBooking.setTitleColor(.black, for: .normal)
        btnSharedBooking.titleLabel?.font = setFont(fontname: .SegoeUISemibold,with: 14.0)
        btnSharedBooking.titleLabel?.adjustsFontSizeToFitWidth = true
        btnSharedBooking.setTitle("Shared booking", for: .normal)
        btnSharedBooking.tag = 1
        btnSharedBooking.addTarget(self, action: #selector(didSelectAirCraftType(_:)), for: .touchUpInside)
        btnSharedBooking.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btnSharedBooking.contentHorizontalAlignment = .left
        btnView.addSubview(btnSharedBooking)

        btnPrivate = btnPrivatBooking
        btnShared = btnSharedBooking

        headerView.addSubview(btnView)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if arrOfRow.count > 1 {
            return 1
        } else {
            return 50
        }
            
    }
}
