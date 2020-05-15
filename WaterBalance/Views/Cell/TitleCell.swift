//
//  TitleCell.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class TitleCell: BaseCollectionCell {
    
    let labelUpper: UILabel = {
        let view = UILabel()
        view.text = "Сон"
        view.textColor = .white
        view.font = view.font.withSize(18)
        return view
    }()
    
    let labelBottom: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    override func setupViews() {
        
        self.backgroundColor = .systemBackground
        addSubview(labelUpper)
        addSubview(labelBottom)
        
        addConstraintWithFormat("H:|-15-[v0]-15-|", views: labelUpper)
        addConstraintWithFormat("H:|-15-[v0]-15-|", views: labelBottom)
        addConstraintWithFormat("V:|[v0][v1]|", views: labelUpper, labelBottom)
        
    }
}

