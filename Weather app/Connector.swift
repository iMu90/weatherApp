//
//  Connector.swift
//  Weather app
//
//  Created by Muteb Alolayan on 9/22/17.
//  Copyright © 2017 Muteb. All rights reserved.
//

import Foundation

class Connector {
    
    var city: String?
    var summary: String?
    var tempMax: Double?
    var tempMin: Double?
    var hum: Double?
    
    

    func main(name: String) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(name)&APPID=cfb1e1a4cef836721031c635d2369c80")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print ("\(error)")
                return
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                if let name = json?["name"] {
                    self.city = name as? String
                }
                if let sum = json?["weather"] as? [[String: Any]]{
//                    print("\(sum)")
                    if let summ = sum[0]["description"]{
                        self.summary = summ as? String
                    }
                }
                
                if let main = json?["main"] as? [String: Any] {
                    if let max = main["temp_max"] {
                        self.tempMax = max as? Double
                    }
                    if let min = main["temp_min"] {
                        self.tempMin = min as? Double
                    }
                    if let hu = main["humidity"] {
                        self.hum = hu as? Double
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
    
}
