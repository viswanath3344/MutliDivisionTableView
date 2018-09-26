//
//  ViewController.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 20/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit





class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var motorStepsTableView: UITableView!
    var motorControlArray = [MotorControl]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motorStepsTableView.tableFooterView = UIView()
        motorStepsTableView.estimatedRowHeight = 60
        motorStepsTableView.rowHeight = UITableViewAutomaticDimension
        
        
//        let motorControlObj0 = MotorControl(stripIndex: "Strip Index", sw: "SW", noOfSteps: "No Of Steps",direction:"Direction", dwellTime: "Dwell Time(Sec)")
//        motorControlArray.append(motorControlObj0)
//
        let motorControlObj1 = MotorControl(stripIndex: "1", sw: "0", noOfSteps: "3",direction:"CW", dwellTime: "5")
        motorControlArray.append(motorControlObj1)
        
        let motorControlObj2 = MotorControl(stripIndex: "2", sw: "0", noOfSteps: "2",direction:"CCW", dwellTime: "1")
        motorControlArray.append(motorControlObj2)
        
        let motorControlObj3 = MotorControl(stripIndex: "3", sw: "0", noOfSteps: "6",direction:"CCW", dwellTime: "3")
        motorControlArray.append(motorControlObj3)
        
        let motorControlObj4 = MotorControl(stripIndex: "4", sw: "0", noOfSteps: "1",direction:"CW", dwellTime: "2")
        motorControlArray.append(motorControlObj4)
        
        let motorControlObj5 = MotorControl(stripIndex: "5", sw: "1", noOfSteps: "6",direction:"CCW", dwellTime: "7")
        motorControlArray.append(motorControlObj5)
        
        let motorControlObj6 = MotorControl(stripIndex: "100", sw: "0", noOfSteps: "10",direction:"CW", dwellTime: "0")
        motorControlArray.append(motorControlObj6)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return motorControlArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MotorCell", for: indexPath) as! MotorStepsTableViewCell
        
        
        let motorControlObject = motorControlArray[indexPath.row]
        cell.stripIndexLabel.text = motorControlObject.stripIndex
        cell.swLabel.text  = motorControlObject.sw
        cell.noOfStepsLabel.text = motorControlObject.noOfSteps
        cell.directionLabel.text = motorControlObject.direction
        cell.dwellTimeLabel.text = motorControlObject.dwellTime
        
        
            cell.labelsStackView.backgroundColor = UIColor.white
            cell.stripIndexLabel.backgroundColor = UIColor.white
            cell.swLabel.backgroundColor = UIColor.white
            cell.noOfStepsLabel.backgroundColor = UIColor.white
            cell.directionLabel.backgroundColor = UIColor.white
            cell.dwellTimeLabel.backgroundColor = UIColor.white
            
            cell.stripIndexLabel.textColor = UIColor.black
            cell.swLabel.textColor = UIColor.black
            cell.noOfStepsLabel.textColor = UIColor.black
            cell.directionLabel.textColor = UIColor.black
            cell.dwellTimeLabel.textColor = UIColor.black
        
          
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sampleView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
         sampleView.backgroundColor = UIColor.darkGray
         let title1 = getLabelWithText(text: "Strip Index")
         let title2 = getLabelWithText(text: "SW")
         let title3 = getLabelWithText(text: "No Of Steps")
         let title4 = getLabelWithText(text: "Direction")
         let title5 = getLabelWithText(text: "Dwell Time(sec)")
        
        let stackView = UIStackView(arrangedSubviews: [title1,title2,title3,title4,title5])
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
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            motorControlArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }


}

extension ViewController
{
    
   
    
}

