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

class DILEntityManager {
    var allEntities = Set<GKEntity>()
    weak var scene: SKScene? = nil
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(entity: GKEntity) {
        allEntities.insert(entity)
        
        if let spriteNode = entity.componentForClass(DILSpriteComponent.self)?.node {
            scene?.addChild(spriteNode)
        }
        
        if let uiNode = entity.componentForClass(DILUIComponent.self)?.label {
            scene?.addChild(uiNode)
        }
    }
    
    func remove(entity: GKEntity) {
        if let spriteNode = entity.componentForClass(DILSpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        if let uiNode = entity.componentForClass(DILUIComponent.self)?.label {
            uiNode.removeFromParent()
        }
        
        allEntities.remove(entity)
    }
}