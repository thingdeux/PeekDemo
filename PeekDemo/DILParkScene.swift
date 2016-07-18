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
    private var entityManager: DILEntityManager? = nil
    private var cameraNode: SKCameraNode?
    private var currentCameraScale: CGFloat = 1
    private var maxCameraScale: CGFloat = 2
    private var minCameraScale: CGFloat = 0.8
    private var zoomAllowed = true
    
    override func didMoveToView(view: SKView) {
        self.entityManager = DILEntityManager(scene: self)
        self.cameraNode = self.childNodeWithName("MainCamera") as? SKCameraNode
        self.cameraNode?.setScale(self.currentCameraScale)
        self.setupGestureRecognizers()
        self.setupUIZoomControls()
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
    
    internal func swipedRight(sender:UISwipeGestureRecognizer){
        print("Right \(sender.direction.rawValue)")
    }
    
    internal func swipedLeft(sender:UISwipeGestureRecognizer){
        print("Left")
    }
    
    internal func swipedUp(sender:UISwipeGestureRecognizer){
        print("Up")
    }
    
    internal func swipedDown(sender:UISwipeGestureRecognizer){
        print("Down")
    }
    
}
// MARK: Camera Handling
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
