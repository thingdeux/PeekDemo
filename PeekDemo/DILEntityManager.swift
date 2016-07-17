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

/// This protocol is required in order to intercept touch events and pass them on to TappableComponents
/*
    Implement each one of these functions to fully support NodeTappableComponents
    Inside of the overriden touch methods on the view call the corresponding receive
    Method - which will in turn notify the recepients that they've been touched.
 */
protocol DILNodeTappableScene {
    func passTouchEndedToManager(touches: Set<UITouch>, withEvent event: UIEvent?)
    func passTouchesBeganToManager(touches: Set<UITouch>, withEvent event: UIEvent?)
    func passTouchesMovedToManager(touches: Set<UITouch>, withEvent event: UIEvent?)
}

extension DILEntityManager {
    func receiveTouchEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.receiveEvents(touches, withEvent: event, type: .TouchEnded)
    }
    
    func receiveTouchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.receiveEvents(touches, withEvent: event, type: .TouchBegan)
    }
    
    func receiveTouchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.receiveEvents(touches, withEvent: event, type: .TouchMoved)
    }
    
//    private func receiveEvents(touches: Set<UITouch>, withEvent event: UIEvent?, type: DILTouchType) {
//        for entity in self.allEntities {
//            if let tappable = entity.componentForClass(DILTappableComponent), firstTouch = touches.first {
//                let viewTouchLocation = firstTouch.locationInView(self)
//                let sceneTouchPoint = scene .convertPointFromView(viewTouchLocation)
//                let touchedNode = scene.nodeAtPoint(sceneTouchPoint)
//                tappable.touchedHandler?(touches: touches, event: event, type: type)
//            }
//        }
//    }
}