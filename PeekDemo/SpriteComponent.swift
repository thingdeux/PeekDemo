//
//  SpriteComponent.swift
//  PeekDemo
//
//  Created by Josh on 7/15/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import GameplayKit
import SpriteKit

class SpriteComponent : GKComponent {
    let node: SKSpriteNode
    
    init(texture: SKTexture) {
        node = SKSpriteNode(texture: texture, color: SKColor.whiteColor(), size: texture.size())
    }
}