//
//  SettingsCollecionCell.swift
//  WaterBalance
//
//  Created by Никита on 12.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class SettingsCollectionCell: BaseCollectionCell {
    
    let leftLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let rightLabel: UITextField = {
        let text = UITextField()
        text.textColor = .systemBlue
        return text
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override func setupViews() {
        
        addSubview(leftLabel)
        addSubview(rightLabel)
        addSubview(dividerLine)
        
        addConstraintWithFormat("H:|-15-[v0][v1]-15-|", views: leftLabel, rightLabel)
        addConstraintWithFormat("V:|-10-[v0]-10-|", views: leftLabel)
        addConstraintWithFormat("V:|-10-[v0]-10-|", views: rightLabel)
        
        addConstraintWithFormat("H:|[v0]|", views: dividerLine)
        addConstraintWithFormat("V:[v0(0.4)]|", views: dividerLine)
        
    }
}
