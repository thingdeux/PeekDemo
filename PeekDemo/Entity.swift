//
//  Entity.swift
//  PeekDemo
//
//  Created by Josh on 7/14/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Monster   : UInt32 = 0b1       // 1
    static let Projectile: UInt32 = 0b10      // 2
}

/// Base Entity for physical objects
class Entity {
}