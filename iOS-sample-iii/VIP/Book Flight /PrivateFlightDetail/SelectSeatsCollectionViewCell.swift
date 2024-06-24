//
//  SelectSeatsCollectionViewCell.swift
//  AircraftApp
//
//  Created by SOTSYS148 on 05/03/20.
//  Copyright © 2020 SOTSYS203. All rights reserved.
//

import UIKit

class SelectSeatsModal {
    
    var seatNumber: Int?
    var isSelected: Bool?
    
    init(seatNumber: Int,isSelected:Bool) {
        self.seatNumber = seatNumber
        self.isSelected = isSelected
    }
}

class SelectSeatsCollectionViewCell: UICollectionViewCell {
    
    //----------------------------
    // MARK:- Outlets Declaration-
    //----------------------------
    @IBOutlet weak var btnSeats: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    
}
