//
//  DILParkJoggingPath.swift
//  PeekDemo
//
//  Created by Josh on 7/17/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import SpriteKit
import GameplayKit

class DILParkJoggingPath : GKEntity {
    init(imageName: String, position: CGPoint) {
        super.init()
        let spriteComponent = DILSpriteComponent(name: imageName, position: position)
        addComponent(spriteComponent)
    }
    
    init(with node: SKNode) {
        
    }
}
