//
//  SaveCollectionCell.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class SaveCell: BaseCollectionCell {
    
    let label: UILabel = {
        let view = UILabel()
        view.text = "Сохранить"
        view.textColor = .white
        view.textAlignment = .center
        view.font = view.font.withSize(18)
        return view
    }()
    
    override func setupViews() {
        
        self.backgroundColor = .systemBlue
        addSubview(label)
        
        addConstraintWithFormat("H:|[v0]|", views: label)
        addConstraintWithFormat("V:|-10-[v0]-10-|", views: label)
        
    }
}
