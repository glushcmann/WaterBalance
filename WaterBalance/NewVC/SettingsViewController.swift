//
//  SettingsViewController.swift
//  WaterBalance
//
//  Created by Никита on 16.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit
import Eureka

class SettingsViewController: FormViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = ""
        
        form +++ Section()
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
        +++ Section()
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
    }
    
}
