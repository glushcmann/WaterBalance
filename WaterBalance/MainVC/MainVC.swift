//
//  ViewController.swift
//  WaterBalance
//
//  Created by Никита on 06.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController {

    let collectionViewLiquidIdentifier = "CollectionViewLiquidCell"
    
//    let imageView : UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named:"background")
//        iv.contentMode = .scaleAspectFill
//        return iv
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.collectionView?.backgroundView = imageView
        collectionView?.backgroundColor = .white
//        navigationController?.navigationBar.backgroundColor = .blue
        
        setupDayInfo()
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(profileTapped))
        let adviceButton = UIBarButtonItem(image: UIImage(systemName: "lightbulb.fill"), style: .plain, target: self, action: #selector(adviceTapped))
        
        navigationItem.leftBarButtonItems = [profileButton, adviceButton]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingsTapped))
        
    }

}

extension MainVC  {
    
    @objc func adviceTapped() {
        let layout = UICollectionViewFlowLayout()
        self.navigationController?.present(ProfileVC(collectionViewLayout: layout), animated: true, completion: nil)
    }
    
    @objc func profileTapped() {
        let layout = UICollectionViewFlowLayout()
         self.navigationController?.present(ProfileVC(collectionViewLayout: layout), animated: true, completion: nil)
    }
    
    @objc func settingsTapped() {
        self.navigationController?.pushViewController(SettingsVC(style: .grouped), animated: true)
    }
    
    func setupDayInfo() {
        
        let dayView = DayInfoContainerView()
        view.addSubview(dayView)
        dayView.layer.cornerRadius = 15
        dayView.backgroundColor = .systemBlue
        dayView.translatesAutoresizingMaskIntoConstraints = false
        
        let progressView = DayProgressContainerView()
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        let bannerView = BannersView()
        view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: dayView)
        addConstraintWithFormat("V:|-120-[v0(100)]-40-[v1(300)]", views: dayView, progressView)
        addConstraintWithFormat("V:[v0(100)]-80-|", views: bannerView)
        addConstraintWithFormat("H:|-50-[v0]-50-|", views: progressView)
        addConstraintWithFormat("H:|[v0]|", views: bannerView)
        
    }
    
}
