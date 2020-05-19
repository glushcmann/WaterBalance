//
//  CalcForFriendViewController.swift
//  WaterBalance
//
//  Created by Никита on 19.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class CalcFriendViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "2,4 л"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 50)
        label.textColor = .systemBlue
        return label
    }()
    
    let labelSex: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        return label
    }()
    
    let labelHeight: UILabel = {
        let label = UILabel()
        label.text = "Рост:"
        return label
    }()
    
    let labelWeight: UILabel = {
        let label = UILabel()
        label.text = "Вес:"
        return label
    }()
    
    let labelAge: UILabel = {
        let label = UILabel()
        label.text = "Возраст:"
        return label
    }()
    
    let segmentedControl: UISegmentedControl = {
        let items = ["Мужской", "Женский"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let sliderHeight: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 240
        slider.isContinuous = true
        return slider
    }()
    
    let sliderWeight: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 240
        slider.isContinuous = true
        return slider
    }()
    
    let sliderAge: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 240
        slider.isContinuous = true
        return slider
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
        
        navigationItem.title = "Рассчет нормы для друга"
        
        view.backgroundColor = .systemBackground
        setupViews()
        
    }
    
    func setupViews() {
        
        view.addSubview(mainLabel)
        view.addSubview(labelSex)
        view.addSubview(segmentedControl)
        view.addSubview(labelHeight)
        view.addSubview(sliderHeight)
        view.addSubview(labelWeight)
        view.addSubview(sliderWeight)
        view.addSubview(labelAge)
        view.addSubview(sliderAge)
        view.addSubview(shareButton)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: mainLabel)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: labelSex)
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: segmentedControl)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: labelHeight)
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: sliderHeight)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: labelWeight)
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: sliderWeight)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: labelAge)
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: sliderAge)
        
        addConstraintWithFormat("H:|-80-[v0]-80-|", views: shareButton)
        
        addConstraintWithFormat("V:|-150-[v0(50)]-20-[v1(40)]-10-[v2(30)]-20-[v3(40)]-10-[v4(30)]-20-[v5(40)]-10-[v6(30)]-20-[v7(40)]-10-[v8(30)]-20-[v9(40)]", views: mainLabel, labelSex, segmentedControl, labelHeight, sliderHeight, labelWeight, sliderWeight, labelAge, sliderAge, shareButton)
    }
    
    
    
}
