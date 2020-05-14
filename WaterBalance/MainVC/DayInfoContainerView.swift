//
//  DayValuesContainer.swift
//  WaterBalance
//
//  Created by Никита on 07.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

final class DayInfoContainerView: UIView {
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "1 день"
        label.textColor = .white
        return label
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "0,25 из 2,33 л"
        label.textColor = .white
        return label
    }()
    
    let progressProcentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .white
        return label
    }()

    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.addSubview(dayLabel)
        self.addSubview(progressLabel)
        self.addSubview(progressProcentLabel)
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressProcentLabel.translatesAutoresizingMaskIntoConstraints = false
                
        addConstraintWithFormat("H:|-30-[v0(80)]-110-[v1]-30-|", views: dayLabel, progressLabel)
        addConstraintWithFormat("H:|-30-[v0(80)]-110-[v1]-30-|", views: dayLabel, progressProcentLabel)
        addConstraintWithFormat("V:|-20-[v0]-20-|", views: dayLabel)
        addConstraintWithFormat("V:|-20-[v0]-10-[v1]-20-|", views: progressLabel, progressProcentLabel)
        
    }
    
}
