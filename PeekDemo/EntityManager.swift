//
//  EntityManager.swift
//  PeekDemo
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    var allEntities = Set<GKEntity>()
    weak var scene: SKScene? = nil
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(entity: GKEntity) {
        allEntities.insert(entity)
        
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            scene?.addChild(spriteNode)
        }
    }
    
    func remove(entity: GKEntity) {
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        allEntities.remove(entity)
    }
}
