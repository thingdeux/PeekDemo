//
//  Entity.swift
//  PeekDemo
//
//  Created by Josh on 7/14/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Background: UInt32 = 1
    static let Person    : UInt32 = 2
    static let Trashcan  : UInt32 = 3
    static let Bench     : UInt32 = 4
    static let Tree      : UInt32 = 5
    static let GoalPost  : UInt32 = 6
    static let Road      : UInt32 = 7
    static let Table      : UInt32 = 8
}

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}
