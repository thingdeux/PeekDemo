//
//  Enemy.swift
//  PeekDemo
//
//  Created by Josh on 7/14/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import SpriteKit

class Monster {
    let scene: SKScene   // TODO: May retain?
    let monsterSpeed: CGFloat
    let floatingName: SKLabelNode
    
    let monster = SKSpriteNode(imageNamed: "monster")
    
    
    init(with scene: SKScene, name: String, at position: CGPoint? = nil) {
        self.floatingName = SKLabelNode(text: name)
        self.scene = scene
        if let position = position {
            self.monster.position = position
        } else {
            // Determine where to spawn the monster along the Y axis
            let actualY = Monster.random(min: monster.size.height/2, max: self.scene.size.height - monster.size.height/2)
            // Position the monster slightly off-screen along the right edge,
            // and along a random position along the Y axis as calculated above
            self.monster.position = CGPoint(x: self.scene.size.width + monster.size.width/2, y: actualY)
        }
        // Determine speed of the monster
        monsterSpeed = Monster.random(min: CGFloat(2.0), max: CGFloat(4.0))
        self.addToScene()
    }
    
    private func addToScene() {
        self.addFloatingText()
        // Add the monster to the scene
        scene.addChild(monster)
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: monster.position.y), duration: NSTimeInterval(self.monsterSpeed))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    private func addFloatingText() {
        self.floatingName.fontSize = 10
        scene.addChild(self.floatingName)
        self.floatingName.position.x = self.monster.position.x
        self.floatingName.position.y = self.monster.position.y - 15
        
    }
    
    private static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    private static func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return Monster.random() * (max - min) + min
    }
}
