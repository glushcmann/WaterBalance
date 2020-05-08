//
//  BannersViewScrollDelegate.swift
//  WaterBalance
//
//  Created by Никита on 08.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

extension BannersView: UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let gap: CGFloat = self.centerItemView.frame.width / 3

        let targetRightOffsetX = targetContentOffset.pointee.x + self.frame.width
        if (self.rightItemView.frame.minX + gap) < targetRightOffsetX {
          targetContentOffset.pointee.x = self.rightItemView.frame.midX - self.frame.midX
        }
        else if (self.leftItemView.frame.maxX - gap) > targetContentOffset.pointee.x {
          targetContentOffset.pointee.x = self.leftItemView.frame.midX - self.frame.midX
        }
        else {
          targetContentOffset.pointee.x = self.centerItemView.frame.midX - self.frame.midX
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard
                self.leftItemView.frame.width > 0,
                self.centerItemView.frame.width > 0,
                self.rightItemView.frame.width > 0
                else {
            return
        }

        let gap: CGFloat = self.centerItemView.frame.width / 3
        let spacing: CGFloat = 8.0

        let currentRightOffset: CGFloat = scrollView.contentOffset.x + self.frame.width + scrollView.contentInset.left

        if (self.rightItemView.frame.maxX - gap) < currentRightOffset {
            scrollView.contentOffset.x -= self.centerItemView.frame.width + spacing
            self.nextItem()
        } else if (self.leftItemView.frame.minX + gap) > scrollView.contentOffset.x {
            scrollView.contentOffset.x += self.centerItemView.frame.width + spacing
            self.prevItem()
        }

    }
    
    func set(viewModel: BannersViewModel) {
        
        self.bannersModel = viewModel
        self.updateViews()
        self.scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 300.0, bottom: 0.0, right: 300.0)
//        self.scrollView.contentOffset.x = self.centerItemView.frame.minX - Constants.horizontalItemOffsetFromSuperView
        
    }

}
