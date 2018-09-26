//
//  DeviceInformationViewController.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 25/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit

struct DeviceInformation {
    var title:String
    var description:String

}

class DeviceInformationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var deviceInformationTable: UITableView!

    let tableViewCellIdentifier = "DeviceInformation"
    
    var deviceInformationArray = [DeviceInformation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deviceInformationTable.rowHeight = UITableViewAutomaticDimension
        deviceInformationTable.estimatedRowHeight = UITableViewAutomaticDimension
        deviceInformationTable.tableFooterView = UIView()
        
        var spectrumDisplayRegionInPixelStart = 0
        var spectrumDisplayRegionInPixelEnd = 0
        var spectrumDisplayRegionInWavelengthStart = 0
        var spectrumDisplayRegionInWavelengthEnd = 0
        var baselineRegionInPixelStart = 0
        var baselineRegionInPixelEnd = 0
        var baselineRegionInWavelengthStart = 0
        var baselineRegionInWavelengthEnd = 0
        var productInfodescription  = "Information about product"
        var testStripInfodescription  = "Information about test strip"
        var motorInfodescription  = "Information about motor "
        var positionSensorInfodescription  = "Information about position sensor"
        var ledInfodescription  = "Information about LED"
        var stripHolderdescription  = "Information about strip holder"
        
        
        
        
        if let spectrumDeviceObject  = JsonDataController.sharedInstance.spectroDeviceObject
        {
           spectrumDisplayRegionInPixelStart = spectrumDeviceObject.spectrumDisplayRegionInPixel.first!
           spectrumDisplayRegionInPixelEnd = spectrumDeviceObject.spectrumDisplayRegionInPixel.last!
          
           spectrumDisplayRegionInWavelengthStart = spectrumDeviceObject.spectrumDisplayRegionInWavelength.first!
           spectrumDisplayRegionInWavelengthEnd = spectrumDeviceObject.spectrumDisplayRegionInWavelength.last!
            
            baselineRegionInPixelStart = spectrumDeviceObject.baselineRegionInPixel.first!
            baselineRegionInPixelEnd = spectrumDeviceObject.baselineRegionInPixel.last!
            
            baselineRegionInWavelengthStart = spectrumDeviceObject.baselineRegionInWavelength.first!
            baselineRegionInWavelengthEnd = spectrumDeviceObject.baselineRegionInWavelength.last!
            
            productInfodescription = spectrumDeviceObject.productInfo
            testStripInfodescription = spectrumDeviceObject.testStripInfo
            motorInfodescription = spectrumDeviceObject.motorInfo
            positionSensorInfodescription = spectrumDeviceObject.positionSensorInfo
            ledInfodescription = spectrumDeviceObject.ledInfo
            stripHolderdescription = spectrumDeviceObject.stripHolderInfo
            
        }
        
        
        let spectrumDisplayRegionInPixel = DeviceInformation(title: "Spectrum Display Region In Pixel", description: "Starting Pixel: \(spectrumDisplayRegionInPixelStart) \nEnding Pixel : \(spectrumDisplayRegionInPixelEnd)")
          deviceInformationArray.append(spectrumDisplayRegionInPixel)
        
        
        let spectrumDisplayRegionWavelength = DeviceInformation(title: "Spectrum Display Region In Wavelength", description: "Starting Wavelength: \(spectrumDisplayRegionInWavelengthStart) \nEnding Wavelength : \(spectrumDisplayRegionInWavelengthEnd)")
        
         deviceInformationArray.append(spectrumDisplayRegionWavelength)
        
        
        let baseLineRegionInPixel = DeviceInformation(title: "Baseline Region In Pixel", description: "Starting Pixel: \(baselineRegionInPixelStart) \nEnding Pixel : \(baselineRegionInPixelEnd)")
        
        deviceInformationArray.append(baseLineRegionInPixel)
        
        
        let baseLineRegionInWavelength = DeviceInformation(title: "Baseline Region In Wavelength", description: "Starting Pixel: \(baselineRegionInWavelengthStart) \nEnding Pixel : \(baselineRegionInWavelengthEnd)")
        
        deviceInformationArray.append(baseLineRegionInWavelength)
        
        
        let productInfo = DeviceInformation(title: "Product Information", description: productInfodescription)
        deviceInformationArray.append(productInfo)
        
        
        let testStripInfo = DeviceInformation(title: "Test Strip Information", description: testStripInfodescription)
        deviceInformationArray.append(testStripInfo)
        
        
        let motorInformation = DeviceInformation(title: "Motor Information", description: motorInfodescription)
        deviceInformationArray.append(motorInformation)
        
        
        let positionSensorInformation = DeviceInformation(title: "Position Sensor Information", description: positionSensorInfodescription)
        deviceInformationArray.append(positionSensorInformation)
        
        
        let lednInformation = DeviceInformation(title: "LED Information", description: ledInfodescription)
        deviceInformationArray.append(lednInformation)
        
        let stripHolderInformation = DeviceInformation(title: "Strip Holder Information", description: stripHolderdescription)
        deviceInformationArray.append(stripHolderInformation)
        
    
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
          return deviceInformationArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! DeviceInformationTableViewCell

        let objDeviceInfo = deviceInformationArray[indexPath.row]
        
         cell.deviceInfoTitleLabel.text = objDeviceInfo.title
         cell.deviceInfoDescriptionLabel.text = objDeviceInfo.description
         cell.selectionStyle = .none
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
