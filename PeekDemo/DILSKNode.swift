//
//  DILSKNode.swift
//  PeekDemo
//
//  Created by Josh on 7/17/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class DILSKSpriteNode : SKSpriteNode {
    var touchHandler: DILNodeTouchedHandler?
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.touchHandler?(touches: touches, event: event, type: .TouchEnded)        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.touchHandler?(touches: touches, event: event, type: .TouchBegan)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        self.touchHandler?(touches: touches, event: event, type: .TouchMoved)
    }
}

class DILSKLabelNode : SKLabelNode {
    var touchHandler: DILNodeTouchedHandler?
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.touchHandler?(touches: touches, event: event, type: .TouchEnded)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.touchHandler?(touches: touches, event: event, type: .TouchBegan)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        self.touchHandler?(touches: touches, event: event, type: .TouchMoved)
    }
}