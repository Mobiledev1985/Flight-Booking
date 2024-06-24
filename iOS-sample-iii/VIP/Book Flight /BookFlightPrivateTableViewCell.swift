//
//  BookFlightPrivateTableViewCell.swift
//  AircraftApp
//
//  Created by SOTSYS148 on 19/02/20.
//  Copyright © 2020 SOTSYS203. All rights reserved.
//

import UIKit

class BookFlightPrivateTableViewCell: UITableViewCell,UITextFieldDelegate {

    //----------------------------
    // MARK:- Outlets Declaration-
    //----------------------------
    
    @IBOutlet weak var backGroundShadowView: UIView!
    @IBOutlet weak var txtDepartureDate: UITextField!
    @IBOutlet weak var txtDepartureTime: UITextField!
    @IBOutlet weak var picUpView: UIView!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblDepartureAirportTitle: UILabel!
    @IBOutlet weak var lblDepartureAirportName: UILabel!
    @IBOutlet weak var lblDestinationAirportTitle: UILabel!
    @IBOutlet weak var lblDestinationAirportName: UILabel!
    @IBOutlet weak var txtSelectAirCraft: DropDown!
    //------------------------------
    // MARK:- Variables Declaration-
    //------------------------------
    lazy var txtCompare = UITextField()
    var datePicker : UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        paddingView(txtDepartureTime)
        paddingView(txtDepartureDate)
//        txtSelectAirCraft.optionArray = ["Aircraft 1","Aircraft 2","Aircraft 3","Aircraft 4","Aircraft 5"]
//        txtSelectAirCraft.didSelect { (txt, int, int1) in
//            print(txt)
//        }
//        txtSelectAirCraft.isSearchEnable = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func applyShadow(view: UIView,shadowColor : CGColor) {
//        view.cornerRadius = 13.0
//        view.clipsToBounds = true
//        view.layer.masksToBounds = false
//        view.layer.shadowRadius = 3.5
//        view.layer.shadowOpacity = 1
//        view.layer.shadowColor = blackShadowColor!
//        view.layer.shadowOffset = CGSize(width: 5 , height:5)
//    }
//    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtCompare = textField
        if textField == self.txtDepartureDate {
            self.pickUpDate(self.txtDepartureDate)
        } else {
            self.pickUpDate(self.txtDepartureTime)
        }
    }
    
    //-------------------------------
    //MARK:- Function of datePicker-
    //-------------------------------
    
    func paddingView(_ txtField: UITextField) {
     
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: txtField.frame.size.height))
        rightView.isUserInteractionEnabled = false
        txtField.rightView = rightView
        txtField.rightViewMode = .always
        
        let imgview = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView?.isUserInteractionEnabled = false
        imgview.center = rightView.center
        if txtField == txtDepartureDate{
            imgview.image = #imageLiteral(resourceName: "icn_calendar")
        } else {
            imgview.image = #imageLiteral(resourceName: "icn_clock")
        }
        
        rightView.addSubview(imgview)
    }
    
    func pickUpDate(_ textField : UITextField){
        
        // DatePicker
        if textField == self.txtDepartureDate {
            self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 216))
            self.datePicker.backgroundColor = UIColor.white
            self.datePicker.datePickerMode = UIDatePicker.Mode.date
            let currentDate = NSDate()
            datePicker.minimumDate = currentDate as Date
            datePicker.date = currentDate as Date
            datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
            textField.inputView = self.datePicker
        } else {
            self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 216))
            self.datePicker.backgroundColor = UIColor.white
            self.datePicker.datePickerMode = UIDatePicker.Mode.time
            textField.inputView = self.datePicker
        }
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black//UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick(_:)))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    //--------------------------------
    // MARK:- Button Done and Cancel-
    //--------------------------------
    
    @objc func doneClick(_ barButton : UIBarButtonItem) {
        let dateFormatter1 = DateFormatter()
        if txtCompare == self.txtDepartureDate{
            dateFormatter1.dateStyle = .medium
            dateFormatter1.dateFormat = "dd MMM, yyyy"
            BookingModel.bookingSharedDM?.iDepartureDate = Int(datePicker.date.timeIntervalSince1970)
        } else {
            dateFormatter1.timeStyle = .short
            BookingModel.bookingSharedDM?.iDepartureTime = Int(datePicker.date.timeIntervalSince1970)
        }
        txtCompare.text = dateFormatter1.string(from: datePicker.date)
        txtCompare.resignFirstResponder()
    }
    @objc func cancelClick(_ barButton : UIBarButtonItem) {
        txtCompare.resignFirstResponder()
    }
    
    @IBAction func btnSwapAction(_ sender: UIButton) {
        let temp = lblDestinationAirportTitle.text
        lblDestinationAirportTitle.text = lblDepartureAirportTitle.text
        lblDepartureAirportTitle.text = temp
        
        let temp1 = lblDestinationAirportName.text
        lblDestinationAirportName.text = lblDepartureAirportName.text
        lblDepartureAirportName.text = temp1
    }
    
}
