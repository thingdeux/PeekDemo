//
//  AnimationComponent.swift
//  PeekDemo
//
//  Animation component - has a dependancy on SpriteComponent
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class AnimationComponent : GKComponent {
    let node: SKSpriteNode
    let texturesToAnimate: [SKTexture]
    let timePerFrame: Double = 0.1
    let name: String
    
    /// SpriteComponent Dependancy
    init(with node: SKSpriteNode, textures: [SKTexture], name: String) {
        self.name = name
        self.node = node
        self.texturesToAnimate = textures
    }
    
    private func startAnimation() {
        
    }
    
    private func stopAnimation() {
        // Stop any animation
        self.node.removeActionForKey(self.name)
    }
    
    private func setAnimationSpeed() {
    }
    
    private func repeatAnimationForever() {
        self.node.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(
                self.texturesToAnimate,
                timePerFrame: self.timePerFrame,
                resize: false,
                restore: true)),
            withKey: self.name)
    }
}
