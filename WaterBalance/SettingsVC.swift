//
//  SettingsVC.swift
//  WaterBalance
//
//  Created by Никита on 06.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    let data = [["Персональная информация", "Распорядок дня", "Уведомления"],
                ["Страна", "Язык", "Единицы измерения"],
                ["Рассчет нормы для друга", "Рассчет нормы на семью"],
                ["Написать разработчикам", "О приложении"]]
    
//    let imageView : UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named:"background")
//        iv.contentMode = .scaleAspectFill
//        return iv
//    }()
    
    override init(style: UITableView.Style) {
        super.init(style: .grouped)
//        self.tableView?.backgroundView = imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
//        setupTableView()
        self.navigationItem.title = "Настройки"
    }

}

extension SettingsVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.data[section].count
     }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
    cell.textLabel?.text = self.data[indexPath.section][indexPath.row]
    
    switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "person.circle.fill")
            case 1:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "alarm")
             case 2:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "bell.fill")
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = self.data[indexPath.section][indexPath.row]
            case 1:
                cell.textLabel?.text = self.data[indexPath.section][indexPath.row]
            case 2:
                cell.textLabel?.text = self.data[indexPath.section][indexPath.row]
            default:
                break
        }
        case 2:
            switch indexPath.row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "person.2.fill")
            case 1:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "person.3.fill")
            default:
                break
            }
        case 3:
        switch indexPath.row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "envelope.fill")
            case 1:
                cell.accessoryType = .disclosureIndicator
                cell.imageView?.image = UIImage(systemName: "info.circle.fill")
            default:
                break
        }
        default: break
        }
    
        return cell

    }
}
