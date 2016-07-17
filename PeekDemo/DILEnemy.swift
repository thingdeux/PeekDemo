// DEPRECATED - Only in use for references






//import SpriteKit
//
//class Monster {
//    private let scene: SKScene   // TODO: May retain?
//    private let monsterSpeed: CGFloat
//    private let floatingName: SKLabelNode
//    
//    private let monster = SKSpriteNode(imageNamed: "side1")
//    
//    init(with scene: SKScene, name: String, at position: CGPoint? = nil) {
//        self.floatingName = SKLabelNode(text: name)
//        self.scene = scene
//        if let position = position {
//            self.monster.position = position
//        } else {
//            // Determine where to spawn the monster along the Y axis
//            let actualY = Monster.random(min: monster.size.height/2, max: self.scene.size.height - monster.size.height/2)            
//            // Position the monster slightly off-screen along the right edge,
//            // and along a random position along the Y axis as calculated above
//            self.monster.position = CGPoint(x: self.scene.size.width + monster.size.width/2, y: actualY)
//        }
//        // Determine speed of the monster
//        monsterSpeed = Monster.random(min: CGFloat(2.0), max: CGFloat(4.0))
//        // Add the monster to the scene
//        scene.addChild(monster)
//        self.setupPhysics()
//        self.addFloatingText()
//        self.startMovement()
//    }
//    
//    static func create(with scene: SKScene, name: String, at position: CGPoint? = nil) {
//        Monster(with: scene, name: name, at: position)
//    }
//    
//    private func setupPhysics() {
////        monster.physicsBody = SKPhysicsBody(rectangleOfSize: monster.size) // 1
////        monster.physicsBody?.dynamic = true // 2
////        monster.physicsBody?.categoryBitMask = PhysicsCategory.Monster // 3
////        monster.physicsBody?.contactTestBitMask = PhysicsCategory.Projectile // 4
////        monster.physicsBody?.collisionBitMask = PhysicsCategory.None // 5
//    }
//    
//    private func startMovement() {
//        // Create the actions
//        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: monster.position.y), duration: NSTimeInterval(self.monsterSpeed))
//        let actionMoveDone = SKAction.removeFromParent()
//        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
//    }
//    
//    private func addFloatingText() {
//        self.monster.addChild(self.floatingName)
//        self.floatingName.fontColor = UIColor.blackColor()
//        self.floatingName.fontSize = 20
//        self.floatingName.position.y = self.floatingName.position.y + 25        
//    }
//    
//    private static func random() -> CGFloat {
//        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
//    }
//    
//    private static func random(min min: CGFloat, max: CGFloat) -> CGFloat {
//        return Monster.random() * (max - min) + min
//    }        
//}
