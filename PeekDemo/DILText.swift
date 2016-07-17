//
//  UIText.swift
//  PeekDemo
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import SpriteKit
import GameplayKit

class DILText : GKEntity {
    init(text: String, type: DILUIType = .Stationary, position: CGPoint, touchHandler: DILNodeTouchedHandler? = nil) {
        super.init()
        self.addComponent(DILUIComponent(text: text, type: type, position: position))
        if let touchHandler = touchHandler {
            guard let uiComponent = self.componentForClass(DILUIComponent), label = uiComponent.label else { return }
            self.addComponent(DILTappableComponent(with: label, with: touchHandler))
        }
    }
}