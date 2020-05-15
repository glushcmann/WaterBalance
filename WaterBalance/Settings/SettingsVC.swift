//
//  SettingsVC.swift
//  WaterBalance
//
//  Created by Никита on 06.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    let cellID = "cellID"
    
    let data = [["Персональная информация", "Распорядок дня", "Уведомления"],
                ["Страна", "Язык", "Единицы измерения"],
                ["Рассчет нормы для друга", "Рассчет нормы на семью"],
                ["Написать разработчикам", "О приложении"]]
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Настройки"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: cellID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        
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
    
    let cell1 = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
    cell1.textLabel?.text = self.data[indexPath.section][indexPath.row]
    
    switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "person.circle.fill")
            case 1:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "alarm")
             case 2:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "bell.fill")
            default:
                return cell1            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SettingsCell
                cell2.leftCountryLabel.text = "Страна"
                cell2.rightCountryLabel.text = "Россия"
                return cell2
            case 1:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SettingsCell
                cell2.leftCountryLabel.text = "Язык"
                cell2.rightCountryLabel.text = "Русский"
                return cell2
            case 2:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SettingsCell
                cell2.leftCountryLabel.text = "Единицы измерения"
                cell2.rightCountryLabel.text = "Метрическая"
                return cell2
            default:
                return  cell1
        }
        case 2:
            switch indexPath.row {
            case 0:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "person.2.fill")
            case 1:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "person.3.fill")
            default:
                return cell1
            }
        case 3:
            switch indexPath.row {
            case 0:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "envelope.fill")
            case 1:
                cell1.accessoryType = .disclosureIndicator
                cell1.imageView?.image = UIImage(systemName: "info.circle.fill")
            default:
                return cell1
        }
        default:
            return cell1
        }
        return cell1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section  {
            case 0:
            switch indexPath.row {
                case 0:
                    let layout = UICollectionViewFlowLayout()
                    layout.scrollDirection = .vertical
                    navigationController?.pushViewController(PersonalInformationVC(collectionViewLayout: layout), animated: true)
                case 1:
                    navigationController?.pushViewController(DayTimeVC(), animated: true)
                case 2:
                    navigationController?.pushViewController(NotificationsVC(), animated: true)
                default:
                    break
            }
            case 1:
            switch indexPath.row {
                case 0:
                    navigationController?.present(CoutriesVC(), animated: true)
                case 1:
                navigationController?.present(LanguageVC(), animated: true)
                default:
                    break
            }
            default:
                break
        }
    }
    
}
