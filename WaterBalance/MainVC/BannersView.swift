//
//  BannersView.swift
//  WaterBalance
//
//  Created by Никита on 07.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//
//

import UIKit

final class BannersView: UIView {
    
    let scrollView = UIScrollView()

    let leftItemView = ItemView()
    let centerItemView = ItemView()
    let rightItemView = ItemView()
    
    var bannersModel = BannersViewModel()
    var currentCenterItemIndex: Int = 0
    
    var leftItemViewModel: BannersViewModel.Item  {
        let leftIndex = bannersModel.items.index(before: self.currentCenterItemIndex)
        return (leftIndex < 0 ? bannersModel.items.last : bannersModel.items[leftIndex])!
    }
    
    var centerItemViewModel: BannersViewModel.Item {
        return bannersModel.items[self.currentCenterItemIndex]
    }
    
    var rightItemViewModel: BannersViewModel.Item {
        let rightIndex = bannersModel.items.index(after: self.currentCenterItemIndex)
        return rightIndex >= bannersModel.items.count ? bannersModel.items.first! : bannersModel.items[rightIndex]
    }
    
    func nextItem() {
        self.currentCenterItemIndex += 1
        if self.bannersModel.items.count == self.currentCenterItemIndex {
            self.currentCenterItemIndex = 0
        }
        self.updateViews()
    }

    func prevItem() {
        self.currentCenterItemIndex -= 1
        if self.currentCenterItemIndex == -1 {
            self.currentCenterItemIndex = self.bannersModel.items.indices.last ?? 0
        }
        self.updateViews()
    }

    func updateViews() {
        self.leftItemView.set(viewModel: self.leftItemViewModel)
        self.centerItemView.set(viewModel: self.centerItemViewModel)
        self.rightItemView.set(viewModel: self.rightItemViewModel)
    }
    
    func setup() {
        self.addSubview(self.scrollView)
        self.setupScrollView()

        let imageViews = [self.leftItemView, self.centerItemView, self.rightItemView]
        imageViews.forEach(self.scrollView.addSubview)
        
//        leftItemView.imageView = UIImage(named: "water-drop")
        
        self.scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        self.scrollView.delegate = self
        
    }
    
    func setupScrollView() {
        self.scrollView.decelerationRate = .fast
        self.scrollView.showsHorizontalScrollIndicator = false
    }

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.scrollView.frame = self.bounds

        let horizontalItemOffsetFromSuperView: CGFloat = 16.0
        let spaceBetweenItems: CGFloat = 8.0
        let itemWidth = self.frame.width - horizontalItemOffsetFromSuperView * 2
        let itemHeight: CGFloat = self.scrollView.frame.height

        var startX: CGFloat = 0.0

        let imageViews = [self.leftItemView, self.centerItemView, self.rightItemView]
        imageViews.forEach { view in
            view.frame.origin = CGPoint(x: startX, y: 0.0)
            view.frame.size = CGSize(width: itemWidth, height: itemHeight)
            startX += itemWidth + spaceBetweenItems
        }

        let viewsCount: CGFloat = 3.0
        let contentWidth: CGFloat = itemWidth * viewsCount + spaceBetweenItems * (viewsCount - 1.0)
        self.scrollView.contentSize = CGSize(width: contentWidth, height: self.frame.height)
    }
    
}
