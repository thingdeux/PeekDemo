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
    let node: SKNode
    let touchedHandler: DILNodeTouchedHandler?
    
    init(with node: SKNode, with handler: DILNodeTouchedHandler?) {
        self.node = node
        self.touchedHandler = handler
    }
}
