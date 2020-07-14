//
//  TabItem.swift
//  SleepSounds
//
//  Created by Bilal Mustafa on 6/10/20.
//  Copyright © 2020 Code Gradients. All rights reserved.
//

import UIKit

enum TabItem: String, CaseIterable {
    case featured = "featured"
    case sounds = "sounds"
    case meditation = "meditation"
    case more = "more"
    
    
    var viewController: UIViewController {
        switch self {
        case .featured:
            return FeaturedViewController()
        case .sounds:
            return SoundsViewController()
        case .meditation:
            return MeditationViewController()
        case .more:
            return MoreViewController()
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .featured:
            return UIImage(named: "Featured")!
        case .sounds:
            return UIImage(named: "sounds")!
        case .meditation:
            return UIImage(named: "meditation")!
        case .more:
            return UIImage(named: "setting")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
