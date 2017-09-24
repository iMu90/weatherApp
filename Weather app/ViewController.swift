//
//  ViewController.swift
//  Weather app
//
//  Created by Muteb Alolayan on 9/22/17.
//  Copyright © 2017 Muteb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchText: UITextField!
    @IBOutlet var city: UILabel!
    @IBOutlet var summay: UITextView!
    @IBOutlet var temp: UILabel!
    @IBOutlet var tempMax: UILabel!
    @IBOutlet var humidity: UILabel!
    let s = Connector()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submit(_ sender: Any) {
        
        s.main(name: searchText.text!)
        if let _ = s.city {
            city.text = s.city
        }
        if let _ = s.summary {
            summay.text = s.summary
        }
        if let _ = s.tempMax {
            tempMax.text = "\(s.tempMax!)"
        }
        if let _ = s.tempMin {
            temp.text = "\(s.tempMin!)"
        }
        if let _ = s.hum {
            humidity.text = "\(s.hum!)"
        }
//        summay.text = "\(s.summary!)"
//        tempMax.text = "\(s.tempMax!)"
//        humidity.text = "\(s.hum!)"
//        temp.text = "\(s.tempMin!)"
        
    }

}

