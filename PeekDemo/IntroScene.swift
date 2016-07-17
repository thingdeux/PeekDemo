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

class Intro: SKScene {
    var entityManager: EntityManager? = nil
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        self.entityManager = EntityManager(scene: self)
        self.setupTitleText()
        self.setupBuildText()
        self.setupTitleCharacter()
    }
    
    private func setupTitleText() {
        guard let centerScreen = self.scene?.size.width, topScreen = self.scene?.size.height else { return }
        let welcomeText = Text(text: "DILIGENCE", position: CGPoint(x: centerScreen / 2, y: topScreen - 80))
        if let welcomeText = welcomeText.componentForClass(UIComponent.self) {
            welcomeText.setColor(to: UIColor.cyanColor())
            welcomeText.setSize(to: 50.0)
        }
        entityManager?.add(welcomeText)
    }
    
    private func setupBuildText() {
        let welcomeText = Text(text: "Prototype Build v0.0.1", position: CGPoint(x: 12, y: 12))
        if let welcomeText = welcomeText.componentForClass(UIComponent.self) {
            welcomeText.setColor(to: UIColor.whiteColor())
            welcomeText.setSize(to: 13.0)
            welcomeText.setAlignment(.Left)
        }
        entityManager?.add(welcomeText)
    }
    
    private func setupTitleCharacter() {
        // TODO: Animate for blinkies
        guard let topScreen = self.scene?.size.height else { return }
        let titleCharacter = SetPiece(imageName: "Front", position: CGPoint(x: 185, y: topScreen - 250))
        if let character = titleCharacter.componentForClass(SpriteComponent.self) {
            character.setOverlayColor(to: UIColor(red: 255, green: 92, blue: 51, alpha: 1.0))
            character.setScale(to: 1.75)
        }
        entityManager?.add(titleCharacter)
    }
}
