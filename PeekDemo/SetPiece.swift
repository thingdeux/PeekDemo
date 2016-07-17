//
//  SetPiece.swift
//  PeekDemo
//
//  Entity class for a "background" object that acts as stationary set dressing (ex: Table / Pot / Tree)
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class SetPiece : GKEntity {
    init(imageName: String, position: CGPoint, animation: [SKTexture]? = nil) {
        super.init()

        let spriteComponent = SpriteComponent(name: imageName, position: position)
        addComponent(spriteComponent)
        
        if let animation = animation {
            addComponent(AnimationComponent(with: spriteComponent.node, textures: animation, name: "pieceAnim\(self)"))
        }
    }        
}