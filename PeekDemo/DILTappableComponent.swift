//
//  TappableComponent.swift
//  PeekDemo
//
//  Handles tap delegate calls and makes an entity tappable.
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

enum DILTouchType {
    case TouchEnded
    case TouchBegan
    case TouchMoved
}

typealias DILNodeTouchedHandler = (touches: Set<UITouch>, event: UIEvent?, type: DILTouchType) -> Void

class DILTappableComponent : GKComponent {
    var spriteNode: DILSKSpriteNode? = nil
    var labelNode: DILSKLabelNode? = nil
    let touchedHandler: DILNodeTouchedHandler?
    
    init(with node: DILSKSpriteNode, with handler: DILNodeTouchedHandler?) {
        self.spriteNode = node
        self.touchedHandler = handler
        self.spriteNode?.userInteractionEnabled = true
        self.spriteNode?.touchHandler = handler
    }
    
    init(with node: DILSKLabelNode, with handler: DILNodeTouchedHandler?) {
        self.labelNode = node
        self.touchedHandler = handler
        self.labelNode?.userInteractionEnabled = true
        self.labelNode?.touchHandler = handler
    }
}
