//
//  NotificationsVC.swift
//  WaterBalance
//
//  Created by Никита on 15.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class NotificationsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellIDTitle = "title"
    let cellIDSwitch = "switch"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellTitle = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDTitle, for: indexPath) as! TitleCell
        let cellSwitch = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDSwitch, for: indexPath) as! SettingsCellSwitch
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cellSwitch.leftLabel.text = "Уведомления"
                return cellSwitch
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                cellSwitch.leftLabel.text = "Уведомления каждые 2 часа"
                return cellSwitch
            case 1:
                cellSwitch.leftLabel.text = "Уведомления перед едой"
                return cellSwitch
            case 2:
                cellSwitch.leftLabel.text = "Уведомления перед тренировкой"
                return cellSwitch
            case 3:
                cellSwitch.leftLabel.text = "Уведомления о высокой температуре воздуха"
                return cellSwitch
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                cellTitle.labelUpper.text = ""
                cellTitle.labelBottom.text = "Для некоторых уведомлений необходимо настроить распорядок дня"
                cellTitle.labelBottom.font = UIFont.systemFont(ofSize: 12)
                cellTitle.labelBottom.preferredMaxLayoutWidth = 650
                cellTitle.labelBottom.lineBreakMode = .byWordWrapping
                cellTitle.labelBottom.numberOfLines = 0
                cellTitle.backgroundColor = .systemBackground
                return cellTitle
            default:
                break
            }
        default:
            break
        }
        
        return cellTitle
    }
    
    
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Распорядок дня"
        configureHierarchy()
        
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayoutDiffSection())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView?.register(TitleCell.self, forCellWithReuseIdentifier: cellIDTitle)
        collectionView?.register(SettingsCellSwitch.self, forCellWithReuseIdentifier: cellIDSwitch)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
}
extension NotificationsVC {
    
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
