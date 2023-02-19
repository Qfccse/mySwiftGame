//
//  Projectile.swift
//  myGame
//
//  Created by macos on 2022/12/06.
//  Copyright  2022 macos. All rights reserved.
//

import SpriteKit
import GameplayKit

class ProjectileEntity: GKEntity {
    var spriteComponent: SpriteComponent!

    init(towerType: TowerType) {
        super.init()
        let texture = SKTexture(imageNamed: "\(towerType.rawValue)Projectile")
        spriteComponent = SpriteComponent(entity: self, texture: texture,  size: texture.size())
        addComponent(spriteComponent)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
