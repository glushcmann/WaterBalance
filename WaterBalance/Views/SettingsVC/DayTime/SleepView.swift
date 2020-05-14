//
//  SleepView.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

//class SleepView: UICollectionViewController {
//
//    let cellID = "cell"
//    let cellIDTitle = "title"
//    let cellIDSwitch = "switch"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView?.register(TitleCell.self, forCellWithReuseIdentifier: cellIDTitle)
//        collectionView?.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
//        collectionView?.register(SettingsCellSwitch.self, forCellWithReuseIdentifier: cellIDSwitch)
//    }
//
//}
//
//extension SleepView {
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//         return 0
//     }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 60)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cellTitle = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDTitle, for: indexPath) as! TitleCell
//        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsCollectionCell
//        let cellSwitch = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDSwitch, for: indexPath) as! SettingsCellSwitch
//
//        switch indexPath.row {
//        case 0:
//            return cellTitle
//        case 1:
//            cell.leftLabel.text = "Просыпаюсь"
//            cell.rightLabel.text = "Добавить"
//            return cell
//        case 2:
//            cell.leftLabel.text = "Ложусь Спать"
//            cell.rightLabel.text = "Добавить"
//            return cell
//        case 4:
//            cellSwitch.leftLabel.text = "Не присылать утреннее уведомление по выходным"
//            return cellSwitch
//        default:
//            break
//        }
//        return cell
//    }
//
//}

class SleepView: UICollectionReusableView {
    
    let cellID = "cell"
    let cellIDTitle = "title"
    let cellIDSwitch = "switch"
    
    let layoutFrame = UICollectionViewFlowLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.register(TitleCell.self, forCellWithReuseIdentifier: cellIDTitle)
        self.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
        self.register(SettingsCellSwitch.self, forCellWithReuseIdentifier: cellIDSwitch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SleepView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellTitle = collectionView.dequeueReusableCell(withReuseIdentifier: cellIDTitle, for: indexPath) as! TitleCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsCollectionCell
        let cellSwitch = collectionView.dequeueReusableCell(withReuseIdentifier: cellIDSwitch, for: indexPath) as! SettingsCellSwitch
        
        switch indexPath.row {
        case 0:
            return cellTitle
        case 1:
            cell.leftLabel.text = "Просыпаюсь"
            cell.rightLabel.text = "Добавить"
            return cell
        case 2:
            cell.leftLabel.text = "Ложусь Спать"
            cell.rightLabel.text = "Добавить"
            return cell
        case 4:
            cellSwitch.leftLabel.text = "Не присылать утреннее уведомление по выходным"
            return cellSwitch
        default:
            break
        }
        return cell
    }
    
}
