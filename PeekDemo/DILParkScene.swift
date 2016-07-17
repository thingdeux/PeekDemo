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
    private var cameraNode: SKCameraNode?
    private var currentScale: CGFloat = 1
    
    override func didMoveToView(view: SKView) {
        self.cameraNode = self.childNodeWithName("MainCamera") as? SKCameraNode
        self.cameraNode?.setScale(self.currentScale)        
        self.setupGestureRecognizers()
        self.setupPinchRecognizers()
    }
    
    // MARK: Gesture Handling
    private func setupGestureRecognizers() {
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(DILParkScene.swipedRight(_:)))
        swipeRight.direction = .Right
        self.view?.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(DILParkScene.swipedLeft(_:)))
        swipeLeft.direction = .Left
        self.view?.addGestureRecognizer(swipeLeft)
        
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(DILParkScene.swipedUp(_:)))
        swipeUp.direction = .Up
        self.view?.addGestureRecognizer(swipeUp)
        
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(DILParkScene.swipedDown(_:)))
        swipeDown.direction = .Down
        self.view?.addGestureRecognizer(swipeDown)
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer){
        print("Right")
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        print("Left")
    }
    
    func swipedUp(sender:UISwipeGestureRecognizer){
        print("Up")
    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        print("Down")
    }
    
    // MARK: Pinch Recognizer
    private func setupPinchRecognizers() {
        let pinch: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(DILParkScene.pinched(_:)))
        self.view?.addGestureRecognizer(pinch)
    }
    
    func pinched(sender:UIPinchGestureRecognizer) {
        print(sender.scale)
        if (self.cameraNode?.xScale < 40 && self.cameraNode?.yScale < 40) {
            self.cameraNode?.runAction(SKAction.scaleBy(sender.scale, duration: 0))
        }
        print("X: \(self.cameraNode?.xScale) Y: \(self.cameraNode?.yScale)")
    }
    
    // MARK: Camera Handling
    private func zoomOut() {
        self.currentScale += 0.1
        self.cameraNode?.setScale(self.currentScale)
    }
}