//
//  RCTableViewCell.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 20/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit

class RCTableViewCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var stripIndexLabel: UILabel!
    @IBOutlet weak var testNameLabel: UILabel!
    @IBOutlet weak var absorptionValue: UILabel!
    @IBOutlet weak var rcTableview: UITableView!
    var rArray = [Int]()
    var cArray = [Int]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
         self.rcTableview.delegate = self
         self.rcTableview.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RCValuesCell", for: indexPath) as! RCValuesTableViewCell
        cell.rValueLabel.text = "\(rArray[indexPath.row])"
        cell.cValueLabel.text = "\(cArray[indexPath.row])"
        cell.backgroundColor = UIColor.lightText
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sampleView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        sampleView.backgroundColor = UIColor.darkGray
        let title1 = getLabelWithText(text: "R")
        let title2 = getLabelWithText(text: "C")
    
        let stackView = UIStackView(arrangedSubviews: [title1,title2])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        sampleView.addSubview(stackView)
        
        //autolayout the stack view - pin 30 up 20 left 20 right 30 down
        let viewsDictionary = ["stackView":stackView]
        let stackView_H = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-5-[stackView]-5-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-5-[stackView]-5-|", //vertical constraint 30 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        sampleView.addConstraints(stackView_H)
        sampleView.addConstraints(stackView_V)
        
        return sampleView
    }
    
    func getLabelWithText(text:String) -> UILabel {
        
        let titleLabel = UILabel()
        titleLabel.text = text
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        return titleLabel
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
          
        }
    }
    

}
