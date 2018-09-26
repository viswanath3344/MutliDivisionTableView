//
//  MotorStepsTableViewCell.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 20/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit

class MotorStepsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelsStackView: UIStackView!
    @IBOutlet weak var stripIndexLabel: UILabel!
    @IBOutlet weak var swLabel: UILabel!
    @IBOutlet weak var noOfStepsLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var dwellTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
