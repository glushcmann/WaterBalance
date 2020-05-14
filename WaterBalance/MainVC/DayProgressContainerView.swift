//
//  DayProgressContainerView.swift
//  WaterBalance
//
//  Created by Никита on 07.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

final class DayProgressContainerView: UIView {
    
    let bottleView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "milk-bottle")
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(bottleView)
    }
    
    override func layoutSubviews() {
        addConstraintWithFormat("H:|[v0]|", views: bottleView)
        addConstraintWithFormat("V:|[v0]|", views: bottleView)
    }
}
