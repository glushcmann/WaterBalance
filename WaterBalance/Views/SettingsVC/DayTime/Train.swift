//
//  Train.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class TrainView: UICollectionViewController {
    
    let cellID = "cell"
    let cellIDTitle = "title"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(TitleCell.self, forCellWithReuseIdentifier: cellIDTitle)
        collectionView?.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
        
    }
}

extension TrainView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellTitle = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDTitle, for: indexPath) as! TitleCell
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsCollectionCell
        
        switch indexPath.row {
        case 0:
            return cellTitle
        case 1:
            cell.leftLabel.text = "Понедельник"
            cell.rightLabel.text = "Добавить"
            return cell
        case 2:
            cell.leftLabel.text = "Вторник"
            cell.rightLabel.text = "Добавить"
            return cell
        case 4:
            cell.leftLabel.text = "Среда"
            cell.rightLabel.text = "Добавить"
            return cell
        case 5:
            cell.leftLabel.text = "Четверг"
            cell.rightLabel.text = "Добавить"
            return cell
        case 6:
            cell.leftLabel.text = "Пятница"
            cell.rightLabel.text = "Добавить"
            return cell
        case 7:
            cell.leftLabel.text = "Суббота"
            cell.rightLabel.text = "Добавить"
            return cell
        case 8:
            cell.leftLabel.text = "Воскресенье"
            cell.rightLabel.text = "Добавить"
            return cell
        default:
            break
        }
        return cell
    }
    
}
