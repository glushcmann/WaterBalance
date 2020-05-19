//
//  DayTimeViewController.swift
//  WaterBalance
//
//  Created by Никита on 19.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit
import Eureka

class DayTimeViewController: FormViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "Распорядок дня"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        form
            
        +++ Section(header: "Сон", footer: "Напоминание о необходимости выпить воды после пробуждения")
        <<< LabelRow(){ row in
            row.title = "Просыпаюсь"
        }
        <<< LabelRow(){ row in
            row.title = "Ложусь Спать"
        }
        <<< SwitchRow(){
            $0.title = "Не присылать утреннее уведомление по выходным"
        }
    
        +++ Section(header: "Прием пищи", footer: "Напоминание о необходимости выпить воды за 30 минут до еды")
        <<< LabelRow(){ row in
            row.title = "Завтрак"
        }
        <<< LabelRow(){ row in
            row.title = "Обед"
        }
        <<< LabelRow(){ row in
            row.title = "Ужин"
        }
        <<< ButtonRow() { row in
            row.title = "Добавить еще один прием пищи"
        }
    
        +++ Section(header: "Тренировки", footer: "Напоминание о необходимости пополнить водный баланс перед тренировкой")
        <<< LabelRow(){ row in
            row.title = "Понедельник"
        }
        <<< LabelRow(){ row in
            row.title = "Вторник"
        }
        <<< LabelRow(){ row in
            row.title = "Среда"
        }
        <<< LabelRow(){ row in
            row.title = "Четверг"
        }
        <<< LabelRow(){ row in
            row.title = "Пятница"
        }
        <<< LabelRow(){ row in
            row.title = "Суббота"
        }
        <<< LabelRow(){ row in
            row.title = "Воскресенье"
        }
        
    }
    
}
