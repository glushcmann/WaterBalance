//
//  PersonalInformationView.swift
//  WaterBalance
//
//  Created by Никита on 09.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class PersonalInformationVC: UITableViewController {
    
    let cellID = "cellID"
    
    let saveButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
        override init(style: UITableView.Style) {
            super.init(style: .plain)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SettingsCell.self, forCellReuseIdentifier: cellID)
    }
    
}

extension PersonalInformationVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 7
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell1 = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SettingsCell
    
    switch indexPath.row {
        case 0:
            cell1.leftCountryLabel.text = "Страна"
            cell1.rightCountryLabel.text = "Россия"
        case 1:
            cell1.leftCountryLabel.text = "Страна"
            cell1.rightCountryLabel.text = "Россия"
        case 2:
            cell1.leftCountryLabel.text = "Страна"
            cell1.rightCountryLabel.text = "Россия"
        case 3:
            cell1.leftCountryLabel.text = "Страна"
            cell1.rightCountryLabel.text = "Россия"
        case 4:
             cell1.leftCountryLabel.text = "Страна"
             cell1.rightCountryLabel.text = "Россия"
        case 5:
             cell1.leftCountryLabel.text = "Страна"
             cell1.rightCountryLabel.text = "Россия"
        case 6:
             cell1.leftCountryLabel.text = "Страна"
             cell1.rightCountryLabel.text = "Россия"
        case 7:
             cell1.leftCountryLabel.text = "Страна"
             cell1.rightCountryLabel.text = "Россия"
        default:
            return cell1
        }
        return cell1
    }
    

    
}
