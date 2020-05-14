//
//  BaseCollectionCell.swift
//  WaterBalance
//
//  Created by Никита on 14.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
    
}
