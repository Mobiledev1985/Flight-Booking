//
//  FlightListTableViewCell.swift
//  AircraftApp
//
//  Created by SOTSYS148 on 26/02/20.
//  Copyright © 2020 SOTSYS203. All rights reserved.
//

import UIKit

class FlightListTableViewCell: UITableViewCell {

    //----------------------------
    // MARK:- Outlets Declaration-
    //----------------------------
    @IBOutlet weak var shadowbackGroundView: UIView!
    @IBOutlet weak var viewForSharedBooking: UIView!
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    @IBOutlet weak var tripTypeView: UIView!
    @IBOutlet weak var imgAircraft: UIImageView!
    @IBOutlet weak var lblAircraftName: UILabel!
    @IBOutlet weak var lblComapanyName: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAvailableSeats: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblDepartureAirportName: UILabel!
    @IBOutlet weak var lblDepartureAirportTitle: UILabel!
    @IBOutlet weak var lblDestinationAirportName: UILabel!
    @IBOutlet weak var lblDestinationAirportTitle: UILabel!
    
    //------------------------------
    // MARK:- Variables Declaration-
    //------------------------------
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
