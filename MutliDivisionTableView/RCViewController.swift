//
//  RCViewController.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 20/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit

struct RCTable {
    var stripIndex:String
    var testName:String
    var absorptionValue:String
    var rValues = [Int]()
    var cValues = [Int]()
}

class RCViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var rcTableView: UITableView!
    var rcTableArray = [RCTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rcTable1 = RCTable(stripIndex: "1", testName: "Protien", absorptionValue: "623.38", rValues: getROrCValues(count: 80), cValues: getROrCValues(count: 80))
        rcTableArray.append(rcTable1)
        
        
        
        let rcTable2 = RCTable(stripIndex: "2", testName: "Glucose", absorptionValue: "323.28", rValues: getROrCValues(count: 90), cValues: getROrCValues(count: 90))
        rcTableArray.append(rcTable2)
        
        
        let rcTable3 = RCTable(stripIndex: "3", testName: "pH", absorptionValue: "423.38", rValues: getROrCValues(count: 80), cValues: getROrCValues(count: 80))
        rcTableArray.append(rcTable3)
        
        
        
        let rcTable4 = RCTable(stripIndex: "4", testName: "Nitrate", absorptionValue: "533.58", rValues: getROrCValues(count: 80), cValues: getROrCValues(count: 80))
        rcTableArray.append(rcTable4)
        
        
        let rcTable5 = RCTable(stripIndex: "5", testName: "SG", absorptionValue: "873.38", rValues: getROrCValues(count: 80), cValues: getROrCValues(count: 80))
        rcTableArray.append(rcTable5)
        
        let rcTable6 = RCTable(stripIndex: "6", testName: "RBC", absorptionValue: "239.88", rValues: getROrCValues(count: 80), cValues: getROrCValues(count: 80))
        rcTableArray.append(rcTable6)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func getROrCValues(count:Int) -> [Int] {
        
        var array = [Int]()
        for i in 1...count
        {
            array.append(i)
        }
        return array
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rcTableArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RCCell", for: indexPath) as! RCTableViewCell
        
        let rcTableObj = rcTableArray[indexPath.section]
        
        cell.stripIndexLabel.text = rcTableObj.stripIndex
        cell.testNameLabel.text = rcTableObj.testName
        cell.absorptionValue.text = "λab = \(rcTableObj.absorptionValue) nm"
        cell.rArray = rcTableObj.rValues
        cell.cArray = rcTableObj.cValues
        cell.rcTableview.reloadData()
        cell.backgroundColor = UIColor.lightText
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  10
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
