//
//  LevelSelectScene.swift
//  PeekDemo
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class DILLevelSelectScene : SKScene {
    var entityManager: DILEntityManager? = nil
    var tappedForNextScreen = false

    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        self.entityManager = DILEntityManager(scene: self)
    }
}
