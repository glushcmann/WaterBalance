//
//  CalcFamilyViewController.swift
//  WaterBalance
//
//  Created by Никита on 19.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class CalcFamilyViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "2,4 л"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 50)
        label.textColor = .systemBlue
        return label
    }()
    
    let segmentedControl: UISegmentedControl = {
        let items = ["На день", "На неделю", "На месяц"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Поделиться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Рассчет нормы на семью"
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(mainLabel)
        view.addSubview(segmentedControl)
        view.addSubview(shareButton)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: mainLabel)
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: segmentedControl)
        addConstraintWithFormat("H:|-80-[v0]-80-|", views: shareButton)
        
        addConstraintWithFormat("V:|-150-[v0(50)]-20-[v1(40)]-20-[v2(40)]", views: mainLabel, segmentedControl, shareButton)
    }
}
