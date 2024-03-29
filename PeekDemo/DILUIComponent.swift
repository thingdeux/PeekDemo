//
//  UIComponent.swift
//  PeekDemo
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

enum DILUIType {
    case Stationary
    case HorizontalScrolling
    case VerticalScrolling
    case Button
}

class DILUIComponent : GKComponent {
    var label: DILSKLabelNode? = nil
    let type: DILUIType
    
    init(text: String, type: DILUIType = .Stationary, position: CGPoint) {
        self.type = type
        super.init()
        
        self.label = DILSKLabelNode(fontNamed: "DINCondensed-Bold")
        guard let labelNode = self.label else { return }
        labelNode.text = text
        labelNode.position = position
        labelNode.horizontalAlignmentMode = .Center
    }
    
    func setColor(to color: UIColor) {
        self.label?.fontColor = color
    }
    
    func setSize(to size: CGFloat) {
        self.label?.fontSize = size
    }
    
    func setAlignment(alignment: SKLabelHorizontalAlignmentMode) {
        self.label?.horizontalAlignmentMode = alignment
    }    
    
}

