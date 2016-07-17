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
    
    init(name: String, position: CGPoint) {
        // Note : I want this to crash if a resource can't be found. It's useless if not loaded.
        self.node = SKSpriteNode(imageNamed: "front")
        self.node.position = position
    }
    
    func setOverlayColor(to color: UIColor) {
        self.node.colorBlendFactor = 1.0
        self.node.color = color        
    }
    
    func setScale(to percentage: CGFloat) {
        node.setScale(percentage)
    }
}