//
//  DayTime.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class DayTimeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SleepView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellID)
    }
    
}

extension DayTimeVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 10
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        var reusableview = UICollectionReusableView()
        if (kind == UICollectionView.elementKindSectionHeader) {
            let section = indexPath.section
            switch (section) {
            case 1:
                let  firstheader: SleepView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "OfferHeaderCell", for: indexPath) as! SleepView
                reusableview = firstheader
            case 2:
                let  secondHeader: FoodView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "APRHeaderCell", for: indexPath) as! FoodView
                reusableview = secondHeader
            default:
                return reusableview

            }
        }
        return reusableview
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviseOfferCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}
