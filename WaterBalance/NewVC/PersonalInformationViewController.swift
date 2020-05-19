//
//  PersonalInformationViewController.swift
//  WaterBalance
//
//  Created by Никита on 16.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit
import Eureka

class PersonalInformationViewController: FormViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        form +++ Section()
            <<< TextRow(){ row in
                row.title = "Имя"
                row.placeholder = "Введите имя"
            }
            <<< TextRow(){ row in
                row.title = "Пол"
                row.placeholder = "Введите пол"
            }
            <<< PickerInlineRow<Int>(){ row in
                row.title = "Рост"
                row.options = []
                for i in 1...240 {
                    row.options.append(i)
                }
            }
            <<< PickerInlineRow<Int>(){ row in
                row.title = "Вес"
                row.options = []
                for i in 1...150 {
                    row.options.append(i)
                }
            }
            <<< DateRow(){ row in
                row.title = "Дата рождения"
            }
            <<< SwitchRow(){
                $0.title = "Уточнять активность при добавлении напитка"
            }
            <<< SwitchRow(){
                $0.title = "Учитывать влияние погоды на водный баланс"
            }
    }
    
}
