//
//  UtilitiesAndMiscExtensions.swift
//  PeekDemo
//
//  Created by Josh on 7/16/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import UIKit
import SpriteKit
import CoreGraphics
import GameplayKit

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

// MARK: Bunch of MAAAAAATH
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

func += (inout left: CGPoint, right: CGPoint) {
    left = left + right
}

func -= (inout left: CGPoint, right: CGPoint) {
    left = left - right
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= (inout left: CGPoint, right: CGPoint) {
    left = left * right
}

func *= (inout point: CGPoint, scalar: CGFloat) {
    point = point * scalar
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= (inout left: CGPoint, right: CGPoint) {
    left = left / right
}

func /= (inout point: CGPoint, scalar: CGFloat) {
    point = point / scalar
}

#if !(arch(x86_64) || arch(arm64))
    func atan2(y: CGFloat, x: CGFloat) -> CGFloat {
        return CGFloat(atan2f(Float(y), Float(x)))
    }
    
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
    
    var angle: CGFloat {
        return atan2(y, x)
    }
}

let π = CGFloat(M_PI)

func shortestAngleBetween(angle1: CGFloat,
                          angle2: CGFloat) -> CGFloat {
    let twoπ = π * 2.0
    var angle = (angle2 - angle1) % twoπ
    if (angle >= π) {
        angle = angle - twoπ
    }
    if (angle <= -π) {
        angle = angle + twoπ
    }
    return angle
}

extension CGFloat {
    func sign() -> CGFloat {
        return (self >= 0.0) ? 1.0 : -1.0
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max))
    }
    
    static func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}

// MARK: Points and vectors
extension CGPoint {
    init(_ point: float2) {
        x = CGFloat(point.x)
        y = CGFloat(point.y)
    }
}
extension float2 {
    init(_ point: CGPoint) {
        self.init(x: Float(point.x), y: Float(point.y))
    }
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

