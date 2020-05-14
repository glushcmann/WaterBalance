//
//  PersonalInformationView.swift
//  WaterBalance
//
//  Created by Никита on 09.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class PersonalInformationVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cell"
    let cellIDSwitch = "switch"
    let cellIDSave = "save"
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Профиль"
        
        collectionView?.backgroundColor = .systemBackground
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(SettingsCellSwitch.self, forCellWithReuseIdentifier: cellIDSwitch)
        collectionView?.register(SaveCell.self, forCellWithReuseIdentifier: cellIDSave)
    }
    
}

extension PersonalInformationVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsCollectionCell
        
        let cellSwitch = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDSwitch, for: indexPath) as! SettingsCellSwitch
        
        let cellSave = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDSave, for: indexPath) as! SaveCell
    
        switch indexPath.row {
            case 0:
                cell.leftLabel.text = "Имя"
                cell.rightLabel.placeholder = "Введите имя"
            case 1:
                cell.leftLabel.text = "Пол"
                cell.rightLabel.placeholder = "Мужской"
            case 2:
                cell.leftLabel.text = "Рост"
                cell.rightLabel.placeholder = "Россия"
            case 3:
                cell.leftLabel.text = "Вес"
                cell.rightLabel.placeholder = "Россия"
            case 4:
                cell.leftLabel.text = "Дата рождения"
                cell.rightLabel.placeholder = "Россия"
            case 5:
                cellSwitch.leftLabel.text = "Уточнять активность при добавлении напистка"
                cellSwitch.leftLabel.textColor = .gray
                cellSwitch.leftLabel.font = cellSwitch.leftLabel.font.withSize(14)
                return cellSwitch
            case 6:
                cellSwitch.leftLabel.text = "Учитывать влияние погоды на водный баланс"
                cellSwitch.leftLabel.textColor = .gray
                cellSwitch.leftLabel.font = cellSwitch.leftLabel.font.withSize(14)
                return cellSwitch
            case 7:
                return cellSave
            default:
                return cell
            }
            return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
}
