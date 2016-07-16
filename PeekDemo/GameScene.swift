//
//  GameScene.swift
//  PeekDemo
//
//  Created by Josh on 7/14/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "side1")
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)        
        addChild(player)
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
//        runAction(SKAction.repeatActionForever(
//            SKAction.sequence([
//                SKAction.runBlock(addMonster),
//                SKAction.waitForDuration(2.0)
//                ])
//            ))
    }
    
//    private func addMonster() {
//        Monster.create(with: self, name: "BOO")
//        Monster.create(with: self, name: "BOO")
//    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        // 1 - Choose one of the touches to work with
//        guard let touch = touches.first else {
//            return
//        }
//        let touchLocation = touch.locationInNode(self)
//        let projectile = SKSpriteNode(imageNamed: "hat1")
//        projectile.position.x = player.position.x + 15
//        projectile.position.y = player.position.y
//        projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
//        projectile.physicsBody?.dynamic = true
//        projectile.physicsBody?.categoryBitMask = PhysicsCategory.Projectile
//        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.Monster
//        projectile.physicsBody?.collisionBitMask = PhysicsCategory.None
//        projectile.physicsBody?.usesPreciseCollisionDetection = true
//        
//        let offset = touchLocation - projectile.position
//        // Bail out if you are shooting down or backwards
//        if (offset.x < 0) { return }
//        addChild(projectile)
//        
//        // Get the direction of where to shoot
//        let direction = offset.normalized()
//        // Make it shoot far enough to be guaranteed off screen
//        let shootAmount = direction * 1000
//        // Add the shoot amount to the current position
//        let realDest = shootAmount + projectile.position
//        let actionMove = SKAction.moveTo(realDest, duration: 2.0)
//        let actionMoveDone = SKAction.removeFromParent()
//        let actionRotate = SKAction.rotateByAngle(-3.14, duration: 0.2)
//        let rotateForever = SKAction.repeatActionForever(actionRotate)
//        
//        projectile.runAction(rotateForever)
//        projectile.runAction(SKAction.sequence([actionMove, actionMoveDone]))        
    }
}

extension GameScene : SKPhysicsContactDelegate {
    func didBeginContact(contact: SKPhysicsContact) {
//        var firstBody: SKPhysicsBody
//        var secondBody: SKPhysicsBody
//        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//            firstBody = contact.bodyA
//            secondBody = contact.bodyB
//        } else {
//            firstBody = contact.bodyB
//            secondBody = contact.bodyA
//        }
//        
//        if ((firstBody.categoryBitMask & PhysicsCategory.Monster != 0) &&
//            (secondBody.categoryBitMask & PhysicsCategory.Projectile != 0)) {
//            guard let firstBody = firstBody.node as? SKSpriteNode, secondBody = secondBody.node as? SKSpriteNode else { return }
//            projectileDidCollideWithMonster(firstBody, monster: secondBody)
//        }
    }
    
//    private func projectileDidCollideWithMonster(projectile:SKSpriteNode, monster:SKSpriteNode) {
//        projectile.removeFromParent()
//        monster.removeFromParent()
//    }
}


