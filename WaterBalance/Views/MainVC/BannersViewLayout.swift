//
//  BannersViewLayout.swift
//  WaterBalance
//
//  Created by Никита on 08.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

extension BannersView {
    
    final class ItemView: UIView {
        var titleLabel = UILabel()
        var subtitleLabel = UILabel()
        var imageView = UIImageView()

        init() {
            super.init(frame: .zero)
            self.setup()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setup() {
            
            self.addSubview(self.imageView)
            self.addSubview(self.titleLabel)
            self.addSubview(self.subtitleLabel)

            self.imageView.contentMode = .scaleAspectFill

            self.layer.masksToBounds = true
            self.layer.cornerRadius = 8.0
            self.backgroundColor = .systemBlue
            
            self.titleLabel.text = "Добавить"
            self.titleLabel.tintColor = .white
            
            self.subtitleLabel.text = "Воду"
            self.subtitleLabel.tintColor = .white
            
            self.imageView.image = UIImage(named: "water-drop")
            
        }

        func set(viewModel: BannersViewModel.Item) {
            self.titleLabel.text = viewModel.title
            self.subtitleLabel.text = viewModel.subtitle
            self.imageView.image = viewModel.image
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.addConstraintWithFormat("H:|-20-[v0(180)]-70-[v1(50)]", views: titleLabel, imageView)
            self.addConstraintWithFormat("H:|-20-[v0(180)]", views: subtitleLabel)
            self.addConstraintWithFormat("V:|-20-[v0]-10-[v1]-20-|", views: titleLabel, subtitleLabel)
            self.addConstraintWithFormat("V:|-10-[v0]-10-|", views: imageView)
        }
    }
}
