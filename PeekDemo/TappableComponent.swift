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

class TappableComponent : GKComponent {
    let node: SKNode
    
    init(with node: SKNode) {
        self.node = node
    }
}
