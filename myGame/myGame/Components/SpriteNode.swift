//
//  SpriteNode.swift
//  myGame
//
//  Created by macos on 2022/12/06.
//  Copyright  2022 macos. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityNode: SKSpriteNode {
    weak var ent: GKEntity!
}

class SpriteComponent: GKComponent {
    let node: EntityNode

    init(entity: GKEntity,
         texture: SKTexture,
         size: CGSize) {
        node = EntityNode(texture: texture, color: SKColor.white, size: size)
        node.ent = entity
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) 初始化失败")
    }
}
