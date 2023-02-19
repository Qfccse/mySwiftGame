//
//  Health.swift
//  myGame
//
//  Created by macos on 2022/12/09.
//  Copyright  2022 macos. All rights reserved.
//

import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
    let fullHealth: Int
    var health: Int
    let healthBarFullWidth: CGFloat
    let healthBar: SKShapeNode
    let soundAction = SKAction.playSoundFileNamed("Hit.mp3", waitForCompletion: false)

    init(parentNode: SKNode,
         barWidth: CGFloat,
         barOffset: CGFloat,
         health: Int) {
        self.fullHealth = health
        self.health = health
        healthBarFullWidth = barWidth
        healthBar = SKShapeNode(rectOf: CGSize(width: healthBarFullWidth, height: 5),
                                cornerRadius: 1)
        healthBar.fillColor = UIColor.green
        healthBar.strokeColor = UIColor.green
        healthBar.position = CGPoint(x: 0, y: barOffset)
        parentNode.addChild(healthBar)
        healthBar.isHidden = false
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) 初始化失败")
    }

    @discardableResult func takeDamage(damage: Int) -> Bool {
        health = max(health - damage,  0)
        healthBar.isHidden = false
        let healthScale = CGFloat(health) / CGFloat(fullHealth)
        let scaleAction = SKAction.scaleX(to: healthScale, duration: 0.5)
        healthBar.run(SKAction.group([soundAction, scaleAction]))
        return health == 0
    }
}
