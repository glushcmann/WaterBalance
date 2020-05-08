//
//  BannersViewModel.swift
//  WaterBalance
//
//  Created by Никита on 08.05.2020.
//  Copyright © 2020 Nikita Glushchenko. All rights reserved.
//

import UIKit

//struct BannersViewModel {
//    // здесь у нас гарантированно 3 ссылки или более на изображения
//    let items: [UIImage] = [UIImage(named: "water-drop")!, UIImage(named: "water-drop")!, UIImage(named: "coffee-bean")!]
//}

class BannersViewModel {
    let items: [Item] = [Item(title: "Добавить", subtitle: "Воду", image: UIImage(named: "water-drop")!),
                         Item(title: "Добавить", subtitle: "Газированную воду", image: UIImage(named: "water-drop")!),
                         Item(title: "Добавить", subtitle: "Кофе", image: UIImage(named: "water-drop")!)]

    class Item {
        let title: String
        let subtitle: String
        let image: UIImage
        
        init(title: String, subtitle: String, image: UIImage) {
            self.title = title
            self.subtitle = subtitle
            self.image = image
        }
    }
}
