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
    private var lastUpdateTimeInterval: CFTimeInterval = 0
    private var lastCameraAdjustmentUpdate: CFTimeInterval = 0
    private var entityManager: DILEntityManager? = nil
    private var cameraNode: SKCameraNode?
    private var currentCameraScale: CGFloat = 1
    private var maxCameraScale: CGFloat = 2
    private var minCameraScale: CGFloat = 0.8
    private var zoomAllowed = true
    
    override func didMoveToView(view: SKView) {
        self.entityManager = DILEntityManager(scene: self)
        self.setupPhysicsBody()
        self.setupGestureRecognizers()
        self.setupUIZoomControls()
    }
    
    private func setupPhysicsBody() {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.cameraNode = self.childNodeWithName("MainCamera") as? SKCameraNode
        guard let camera = self.cameraNode else { return }
        camera.setScale(self.currentCameraScale)
        camera.physicsBody?.affectedByGravity = true
        camera.physicsBody?.dynamic = true
        camera.physicsBody?.usesPreciseCollisionDetection = false
        camera.physicsBody?.mass = 1
    }
    
    
}

// MARK: Gesture Handling
extension DILParkScene {
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
    
    internal func swipedRight(sender:UISwipeGestureRecognizer){
        guard let current = self.cameraNode?.position else { return }
        self.cameraNode?.runAction(SKAction.moveTo(CGPoint(x: current.x - 200.0, y: current.y), duration: 0.2))
    }
    
    internal func swipedLeft(sender:UISwipeGestureRecognizer){
        guard let current = self.cameraNode?.position else { return }
        self.cameraNode?.runAction(SKAction.moveTo(CGPoint(x: current.x + 200.0, y: current.y), duration: 0.2))
    }
    
    internal func swipedUp(sender:UISwipeGestureRecognizer){
        guard let current = self.cameraNode?.position else { return }
        self.cameraNode?.runAction(SKAction.moveTo(CGPoint(x: current.x, y: current.y - 200), duration: 0.2))
    }
    
    internal func swipedDown(sender:UISwipeGestureRecognizer) {
        guard let current = self.cameraNode?.position else { return }
        self.cameraNode?.runAction(SKAction.moveTo(CGPoint(x: current.x, y: current.y + 200), duration: 0.2))
    }
}

// MARK: Camera Zooming
extension DILParkScene {
    private func setupUIZoomControls() {
        guard let topScreen = self.scene?.size.height else { return }
        let zoomOutButton = DILSetPiece(imageName: "ZoomOut", position: CGPoint(x: 105, y: (topScreen / 2) - 30)) { [weak self] (touches, event, type) in
            self?.zoomOut()
        }
        if let zoomOutButton = zoomOutButton.componentForClass(DILSpriteComponent.self) {
            zoomOutButton.setOverlayColor(to: UIColor.redColor())
            zoomOutButton.setScale(to: 1)
        }
        let zoomInButton = DILSetPiece(imageName: "ZoomIn", position: CGPoint(x: 160, y: (topScreen / 2) - 30))  { [weak self] (touches, event, type) in
            self?.zoomIn()
        }
        if let zoomInButton = zoomOutButton.componentForClass(DILSpriteComponent.self) {
            zoomInButton.setOverlayColor(to: UIColor.whiteColor())
            zoomInButton.setScale(to: 1)
        }
        
        entityManager?.add(zoomOutButton, to: self.cameraNode)
        entityManager?.add(zoomInButton, to: self.cameraNode)
    }
    
    private func zoomOut() {
        if (self.currentCameraScale < self.maxCameraScale) {
            self.currentCameraScale += 0.2
            self.cameraNode?.setScale(self.currentCameraScale)
        }
    }
    
    private func zoomIn() {
        if (self.currentCameraScale > self.minCameraScale) {
            self.currentCameraScale -= 0.2
            self.cameraNode?.setScale(self.currentCameraScale)
        }
    }
}






// MARK: Some other time
//    private func setupPinchRecognizers() {
//        let pinch: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(DILParkScene.pinched(_:)))
//        self.view?.addGestureRecognizer(pinch)
//    }

//    func pinched(sender:UIPinchGestureRecognizer) {
//        let scaleToSet = self.currentCameraScale * sender.scale
//        if (scaleToSet > self.minCameraScale && scaleToSet < self.maxCameraScale) {
//            self.zoomAllowed = false
//            self.currentCameraScale = self.currentCameraScale * sender.scale
//            self.cameraNode?.runAction(SKAction.scaleBy(sender.scale, duration: 0))
//        }
//    }
