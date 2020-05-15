//
//  LanguageVC.swift
//  WaterBalance
//
//  Created by Никита on 15.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class LanguageVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellIDTitle = "title"
    let cellID = "cellID"
    
    let data = ["Росский", "Украинский", "Английский"]
    
    var collectionView: UICollectionView! = nil
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         switch section {
         case 0:
             return 1
         case 1:
            return data.count
         default:
             return 1
         }
     }
     
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 2
     }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let cellTitle = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDTitle, for: indexPath) as! TitleCell
         let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsCollectionCell
         
         switch indexPath.section {
         case 0:
             switch indexPath.row {
             case 0:
                cellTitle.labelUpper.text = "Выбирите язык"
                cellTitle.labelUpper.textColor = .black
                cellTitle.labelUpper.font = UIFont.boldSystemFont(ofSize: 24)
                 return cellTitle
             default:
                 break
             }
         case 1:
            cell.leftLabel.text = data[indexPath.row]
         default:
             break
         }
         
         return cell
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayoutDiffSection())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: cellIDTitle)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
}

extension LanguageVC {
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(CGFloat(10))
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func createLayoutDiffSection() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let columns = 1
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(60))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.absolute(60)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 20, trailing: 5)
            return section
        }
        return layout
    }
}

