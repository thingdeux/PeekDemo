//
//  GameScene.swift
//  PeekDemo
//
//  Created by Josh on 7/14/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)        
        addChild(player)
        
        let newMonster = Monster(with: self, name: "Bill")
        let newMonster2 = Monster(with: self, name: "Jake")        
    }
}
