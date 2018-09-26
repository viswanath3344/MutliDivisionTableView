//
//  DeviceInformationTableViewCell.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 25/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit

class DeviceInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceInfoTitleLabel: UILabel!
    
    @IBOutlet weak var deviceInfoDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
