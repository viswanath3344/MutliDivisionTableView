//
//  JsonDataController.swift
//  MutliDivisionTableView
//
//  Created by Ming-En Liu on 25/09/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit


struct SpectorDeviceData:Decodable {
    
    var productInfo:String
    var testStripInfo:String
    var modifiedDate:String
    var spectrumDisplayRegionInPixel:[Int]
    var spectrumDisplayRegionInWavelength:[Int]
    var baselineRegionInPixel:[Int]
    var baselineRegionInWavelength:[Int]
    var motorInfo:String
    var positionSensorInfo:String
    var ledInfo:String
    var stripHolderInfo:String
    var imageSensor :ImageSensor
    var wavelengthCalibration:WavelengthCalibration
    var stripControl:StripControl
    var RCTable:[RCTableData]
    var wifiDetails:WifiDetails
}
struct ImageSensor:Decodable {
    var exposureTime:Int
    var analogGain:Int
    var digitalGain:Double
    var noOfAverage:Int
    var spectrumLineSampling:Int
    var ROIinVertical:[Int]
    
}

struct WavelengthCalibration:Decodable {
    var noOfCoefficients:Int
    var coefficients:[Double]
}

struct StripControl:Decodable {
    var distanceFromPostionSensorToSpectroMeterInMM:Double
    var distanceFromHolderEdgeTo1STStripInMM:Double
    var distancePerStepInMM:Double
    var steps:[Steps]
}

struct WifiDetails:Decodable {
    var ssid:String
    var password:String
    var iPAddress:String
    var port:Int
}


struct Steps:Decodable {
    var stripIndex:Int
    var testName:String
    var noOfSteps:Int
    var distanceInMM:Double
    var direction:String
    var dwellTimeInSec:Int
    var standardWhiteIndex:Int
}

struct RCTableData:Decodable {
    var stripIndex:Int
    var testItem : String
    var criticalwavelength:Double
    var R:[Double]
    var  C:[Double]
}



struct MotorControl {
    var stripIndex:String
    var sw:String
    var noOfSteps:String
    var direction:String
    var dwellTime:String
}


class JsonDataController: NSObject {

    var spectroDeviceObject:SpectorDeviceData?
    
    class var sharedInstance: JsonDataController {
        
        struct Singleton {
            static let instance = JsonDataController()
        }
        return Singleton.instance
    }
    
    private override init() {
        super.init()
    }
    
    
    func loadJsonDataFromUrl()
    {
        let jsonUrl  = "http://18.204.210.99/files/data.json"
        
        guard let url  = URL(string: jsonUrl) else
        {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else
            {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //  decoder.keyDecodingStrategy = .convertFromSnakeCase  // replace _
                let webSiteDescriptionObject = try decoder.decode(SpectorDeviceData.self, from: data)
            
                self.spectroDeviceObject = webSiteDescriptionObject
            
                print(self.spectroDeviceObject!.testStripInfo)
                print(self.spectroDeviceObject!.productInfo)
                
                print(self.spectroDeviceObject!.imageSensor.analogGain)
                print(self.spectroDeviceObject!.imageSensor.digitalGain)
                print(self.spectroDeviceObject!.imageSensor.exposureTime)
                print(self.spectroDeviceObject!.imageSensor.noOfAverage)
                
                
            }
            catch let jsonError
            {
                print("JsonParsing Error \(jsonError)")
                
            }
            
            }.resume()
    }
}
