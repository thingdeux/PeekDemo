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

enum UIType {
    case Stationary
    case HorizontalScrolling
    case VerticalScrolling
    case Button
}

class UIComponent : GKComponent {
    let scene: SKScene? = nil
    let label: SKLabelNode? = nil
    let type: UIType
    let UIText: String?
    
    init(text: String, type: UIType = .Stationary, position: CGPoint, scrollDelay: Int = 0) {
        self.UIText = text
        self.type = type
        super.init()
        self.addToScene()
        self.scrollIfNecessary(with: scrollDelay)
    }
    
    private func scrollIfNecessary(with delay: Int) {
    }
    
    private func addToScene() {
        if let _ = self.scene {
            switch (self.type) {
            case .Stationary:
                self.initStationary()
            case .HorizontalScrolling:
                self.startHorizontalScroller()
            case .VerticalScrolling:
                self.startVeriticalScroller()
            case .Button:
                self.initButton()
            }
        }
    }
    
    private func initStationary() {
        
    }
    private func initButton() {
    }
    
    private func startVeriticalScroller() {
    }
    
    private func startHorizontalScroller() {
        
    }
    
}

