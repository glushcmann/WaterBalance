//
//  SettingsCell.swift
//  WaterBalance
//
//  Created by Никита on 09.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class SettingsCell: BaseCell {
    
    let leftCountryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let rightCountryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    override func setupViews() {
        
        addSubview(leftCountryLabel)
        addSubview(rightCountryLabel)
        
        addConstraintWithFormat("H:|-15-[v0]-100-[v1]-15-|", views: leftCountryLabel, rightCountryLabel)
        addConstraintWithFormat("V:|-10-[v0]-10-|", views: leftCountryLabel)
        addConstraintWithFormat("V:|-10-[v0]-10-|", views: rightCountryLabel)
        
    }
}
