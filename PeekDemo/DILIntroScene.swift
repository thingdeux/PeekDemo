//
//  IntroScene.swift
//  PeekDemo
//
//  Intro scene - plot details and "level" selection
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class DILIntro: SKScene {
    var entityManager: DILEntityManager? = nil
    var tappedForNextScreen = false
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        self.entityManager = DILEntityManager(scene: self)
        self.setupTitleText()
        self.setupBuildText()
        self.setupTitleCharacter()
    }
    
    private func setupTitleText() {
        guard let centerScreen = self.scene?.size.width, topScreen = self.scene?.size.height else { return }
        let welcomeText = DILText(text: "DILIGENCE", position: CGPoint(x: centerScreen / 2, y: topScreen - 80))
        if let welcomeText = welcomeText.componentForClass(DILUIComponent.self) {
            welcomeText.setColor(to: UIColor.whiteColor())
            welcomeText.setSize(to: 50.0)
        }
        entityManager?.add(welcomeText)
    }
    
    private func setupBuildText() {
        let welcomeText = DILText(text: "Prototype Build v0.0.1", position: CGPoint(x: 12, y: 12))
        if let welcomeText = welcomeText.componentForClass(DILUIComponent.self) {
            welcomeText.setColor(to: UIColor.whiteColor())
            welcomeText.setSize(to: 14.0)
            welcomeText.setAlignment(.Left)
        }
        entityManager?.add(welcomeText)
    }
    
    private func setupTitleCharacter() {
        guard let topScreen = self.scene?.size.height else { return }
        let titleCharacter = DILSetPiece(imageName: "Front",
                                      position: CGPoint(x: 185, y: topScreen - 300),
                                      animation: [SKTexture(imageNamed: "Front"), SKTexture(imageNamed: "Front1")])        
        if let character = titleCharacter.componentForClass(DILSpriteComponent.self) {
            character.setOverlayColor(to: UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1))
            character.setScale(to: 1.40)
        }
        if let animation = titleCharacter.componentForClass(DILAnimationComponent.self) {
            animation.setAnimationSpeed(to: 0.1)
            animation.repeatAnimationForever(delay: 3)
        }
        entityManager?.add(titleCharacter)
    }
}
