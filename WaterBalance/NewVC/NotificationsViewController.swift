//
//  NotificationsViewController.swift
//  WaterBalance
//
//  Created by Никита on 19.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit
import Eureka

class NotificationsViewController: FormViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "Уведомления"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        form
            +++ Section()
            <<< SwitchRow(){
                $0.title = "Уведомления"
            }
        
            +++ Section(footer: "Для некоторых уведомлений необходимо настроить распорядок дня")
            <<< SwitchRow(){
                $0.title = "Уведомления каждые 2 часа"
            }
            <<< SwitchRow(){
                $0.title = "Уведомления перед едой"
            }
            <<< SwitchRow(){
                $0.title = "Уведомления перед тренировкой"
            }
            <<< SwitchRow(){
                $0.title = "Уведомления о высокой температуре воздуха"
            }
    }
    
}

