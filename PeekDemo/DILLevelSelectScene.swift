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
    var briefLines: Double = 1.0
    var canGoToElevator = false
    var selectedLevel = false

    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        self.entityManager = DILEntityManager(scene: self)
        self.setupMissionBrief()
        self.setupLevelPortals()
    }
    
    private func setupMissionBrief() {
        self.addMissionBrief(text: "Agent, our world class spy network has informed us of")
        self.addMissionBrief(text: "numerous attempts by foreign forces to undermine our")
        self.addMissionBrief(text: "government and overthrow our president. Foreign Agents")
        self.addMissionBrief(text: "have been using the park near Romall precinct to share")
        self.addMissionBrief(text: "information of their operations.  Find them, and report")
        self.addMissionBrief(text: "back.  You have numerous resources are your disposal.")
        self.addMissionBrief(text: " ")
        self.addMissionBrief(text: "Be Vigilent.")
    }
    
    private func addMissionBrief(text briefText: String) {
        guard let topScreen = self.scene?.size.height else { return }
        let yPosition = (topScreen - 40) - CGFloat(self.briefLines * 30.0)
        let briefText = DILText(text: briefText, position: CGPoint(x: 15, y: yPosition))
        if let briefText = briefText.componentForClass(DILUIComponent.self) {
            briefText.setColor(to: UIColor.whiteColor())
            briefText.setSize(to: 20.0)
            briefText.setAlignment(.Left)
        }
        entityManager?.add(briefText)
        self.briefLines += 1.0
    }
    
    private func setupLevelPortals() {
        self.drawElevatorLevelPortal()
        self.drawParkLevelPortal()
    }
    
    private func drawElevatorLevelPortal() {
        guard let centerScreen = self.scene?.size.width else { return }
        let elevatorText = DILText(text: "ELEVATOR", position: CGPoint(x: centerScreen / 2, y: 125)) { [weak self] (touches, event, type) in
            if self?.canGoToElevator == true {
                if type == .TouchBegan {
                    print("GO TO ELEVATOR LEVEL")
                }
            }
        }
        if let elevatorText = elevatorText.componentForClass(DILUIComponent.self) {
            if (self.canGoToElevator == false) {
                elevatorText.setColor(to: UIColor.lightGrayColor())
            } else {
                elevatorText.setColor(to: UIColor.whiteColor())
            }
            elevatorText.setSize(to: 30.0)
            elevatorText.setAlignment(.Center)
        }
        entityManager?.add(elevatorText)
    }
    
    private func drawParkLevelPortal() {
        guard let centerScreen = self.scene?.size.width else { return }
        let elevatorText = DILText(text: "PARK", position: CGPoint(x: centerScreen / 2, y: 175)) { (touches, event, type) in
            if type == .TouchEnded {
                if (self.selectedLevel == false) {
                    self.selectedLevel = true
                    if let parkScene = DILParkScene(fileNamed: "DILParkScene") {
                        self.view?.presentScene(parkScene, transition: SKTransition.pushWithDirection(.Left, duration: 0.2))
                        dispatchOnMainQueue(seconds: 2.0, dispatchBlock: {
                            self.entityManager?.cleanupAllEntities()
                        })
                    }
                }
            }
        }
        if let elevatorText = elevatorText.componentForClass(DILUIComponent.self) {
            elevatorText.setColor(to: UIColor.whiteColor())
            elevatorText.setSize(to: 30.0)
            elevatorText.setAlignment(.Center)
        }
        entityManager?.add(elevatorText)
    }
    
    
}
