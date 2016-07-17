//
//  UIText.swift
//  PeekDemo
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import SpriteKit
import GameplayKit

class Text : GKEntity {
    init(text: String, type: UIType = .Stationary, position: CGPoint) {
        super.init()
        self.addComponent(UIComponent(text: text, type: type, position: position))
    }
}