//
//  DayTime.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class DayTimeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellID = "cell"
    let cellIDTitle = "title"
    let cellIDSwitch = "switch"
    let cellIDAdd = "add"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 5
        case 2:
            return 8
        default:
            return 1
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellTitle = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDTitle, for: indexPath) as! TitleCell
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsCollectionCell
        let cellSwitch = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDSwitch, for: indexPath) as! SettingsCellSwitch
        let cellAdd = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIDAdd, for: indexPath) as! SaveCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cellTitle.labelUpper.text = "Сон"
                cellTitle.labelUpper.textColor = .black
                cellTitle.labelUpper.font = UIFont.boldSystemFont(ofSize: 24)
                cellTitle.labelBottom.text = "Напоминание о необходимости выпить воды после пробуждения"
                cellTitle.labelBottom.font = UIFont.systemFont(ofSize: 12)
                cellTitle.backgroundColor = .systemBackground
                return cellTitle
            case 1:
                cell.leftLabel.text = "Просыпаюсь"
                cell.rightLabel.text = "Добавить"
                return cell
            case 2:
                cell.leftLabel.text = "Ложусь Спать"
                cell.rightLabel.text = "Добавить"
                return cell
            case 3:
                cellSwitch.leftLabel.text = "Не присылать утреннее уведомление по выходным"
                cellSwitch.leftLabel.font = cellSwitch.leftLabel.font.withSize(12)
                cellSwitch.leftLabel.textColor = .darkGray
                return cellSwitch
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                cellTitle.labelUpper.text = "Прием пищи"
                cellTitle.labelUpper.textColor = .black
                cellTitle.labelUpper.font = UIFont.boldSystemFont(ofSize: 24)
                cellTitle.labelBottom.text = "Напоминание о необходимости выпить воды за 30 минут до еды"
                cellTitle.labelBottom.font = UIFont.systemFont(ofSize: 12)
                cellTitle.backgroundColor = .systemBackground
                return cellTitle
            case 1:
                cell.leftLabel.text = "Завтрак"
                cell.rightLabel.text = "Добавить"
                return cell
            case 2:
                cell.leftLabel.text = "Обед"
                cell.rightLabel.text = "Добавить"
                return cell
            case 3:
                cell.leftLabel.text = "Ужин"
                cell.rightLabel.text = "Добавить"
                return cell
            case 4:
                cellAdd.label.text = "Добавить еще один прием пищи"
                return cellAdd
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                cellTitle.labelUpper.text = "Тренировки"
                cellTitle.labelUpper.textColor = .black
                cellTitle.labelUpper.font = UIFont.boldSystemFont(ofSize: 24)
                cellTitle.labelBottom.text = "Напоминание о необходимости пополнить водный баланс перед тренировкой"
                cellTitle.labelBottom.font = UIFont.systemFont(ofSize: 12)
                cellTitle.labelBottom.preferredMaxLayoutWidth = 650
                cellTitle.labelBottom.lineBreakMode = .byWordWrapping
                cellTitle.labelBottom.numberOfLines = 0
                cellTitle.backgroundColor = .systemBackground
                return cellTitle
            case 1:
                cell.leftLabel.text = "Понедельник"
                cell.rightLabel.text = "Добавить"
                return cell
            case 2:
                cell.leftLabel.text = "Вторник"
                cell.rightLabel.text = "Добавить"
                return cell
            case 3:
                cell.leftLabel.text = "Среда"
                cell.rightLabel.text = "Добавить"
                return cell
            case 4:
                cell.leftLabel.text = "Четверг"
                cell.rightLabel.text = "Добавить"
                return cell
            case 5:
                cell.leftLabel.text = "Пятница"
                cell.rightLabel.text = "Добавить"
                return cell
            case 6:
                cell.leftLabel.text = "Суббота"
                cell.rightLabel.text = "Добавить"
                return cell
            case 7:
                cell.leftLabel.text = "Воскресенье"
                cell.rightLabel.text = "Добавить"
                return cell
            default:
                break
            }
        default:
            break
        }
        
        
        return cell
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
        collectionView?.register(SettingsCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(SettingsCellSwitch.self, forCellWithReuseIdentifier: cellIDSwitch)
        collectionView?.register(SaveCell.self, forCellWithReuseIdentifier: cellIDAdd)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
}
extension DayTimeVC {
    
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
