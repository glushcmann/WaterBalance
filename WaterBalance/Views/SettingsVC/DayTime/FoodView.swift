//
//  FoodView.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class FoodView: UICollectionViewController {
    
    let cellID = "cell"
    let cellIDTitle = "title"
    let cellIDAdd = "add"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(TitleCell.self, forCellWithReuseIdentifier: cellIDTitle)
        collectionView?.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(SaveCell.self, forCellWithReuseIdentifier: cellIDAdd)
        
    }
}

extension FoodView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
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
        let cellAdd = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDAdd, for: indexPath) as! SaveCell
        
        switch indexPath.row {
        case 0:
            return cellTitle
        case 1:
            cell.leftLabel.text = "Завтрак"
            cell.rightLabel.text = "Добавить"
            return cell
        case 2:
            cell.leftLabel.text = "Обед"
            cell.rightLabel.text = "Добавить"
            return cell
        case 4:
            cell.leftLabel.text = "Ужин"
            cell.rightLabel.text = "Добавить"
            return cell
        case 5:
            cellAdd.label.text = "Добавить еще один прием пищи"
            return cellAdd
        default:
            break
        }
        return cell
    }
    
}
