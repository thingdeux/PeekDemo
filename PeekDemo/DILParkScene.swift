//
//  DILParkScene.swift
//  PeekDemo
//
//  Created by Josh on 7/17/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class DILParkScene : SKScene {
    var cameraNode: SKCameraNode?
    
    override func didMoveToView(view: SKView) {
        self.cameraNode = self.childNodeWithName("MainCamera") as? SKCameraNode
        print(self.cameraNode)
    }
}