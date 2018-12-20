//
//  UIButtonExtension.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/19.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit


extension UIButton {
    
    func styleAsFloatingButton() {
        
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 8 )
    }
    
    
}

