//
//  SpriteComponent.swift
//  PeekDemo
//
//  Created by Josh on 7/15/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import GameplayKit
import SpriteKit

class DILSpriteComponent : GKComponent {
    let node: SKSpriteNode
    
    init(name: String, position: CGPoint) {
        // Note : I want this to crash if a resource can't be found. It's useless if not loaded.
        self.node = SKSpriteNode(imageNamed: name)
        self.node.position = position
    }
    
    func setOverlayColor(to color: UIColor) {
        self.node.colorBlendFactor = 1.0
        self.node.color = color        
    }
    
    func setScale(to percentage: CGFloat) {
        node.setScale(percentage)
    }
    
    func flipHorizontally() {
        if (self.node.xScale > 0) {
            self.node.xScale = -1.0
        } else {
            self.node.xScale = 1.0
        }
    }
}