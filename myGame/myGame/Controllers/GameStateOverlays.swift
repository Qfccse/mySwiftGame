//
//  GameStateOverlays.swift
//  myGame
//
//  Created by macos on 2022/12/09.
//  Copyright  2022 macos. All rights reserved.
//

import Foundation
import SpriteKit

class ReadyNode: SKNode {
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var tapLabel: SKLabelNode {
        return self.childNode(withName: "TapLabel") as! SKLabelNode
    }

    func show() {
        tapLabel.setScale(0.1)
        let actionZoomIn = SKAction.scale(to: 1.0, duration: 1.0)
        actionZoomIn.timingMode = .easeIn
        let actionPulseIn = SKAction.scale(to: 1.05, duration: 0.2)
        let actionPulseOut = SKAction.scale(to: 0.95, duration: 0.2)
        let actionPulse = SKAction.sequence([actionPulseIn, actionPulseOut])
        let action = SKAction.sequence([actionZoomIn, SKAction.repeatForever(actionPulse)])
        tapLabel.run(action)
    }

    func hide() {
        let actionZoomOut = SKAction.scale(to: 0.1, duration: 1.0)
        actionZoomOut.timingMode = .easeOut
        tapLabel.run(actionZoomOut)
        let actionFadeOut = SKAction.fadeAlpha(to: 0.0, duration: 1.0)
        let actionPop = SKAction.run { () -> Void in
            self.removeFromParent()
        }
        let action = SKAction.sequence([actionFadeOut, actionPop])
        self.run(action)
    }
}

class WinNode: SKNode {
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func show() {
    }
    
    func hide(){
        
    }
}

class LoseNode: SKNode {
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func show() {
    }
    
    func hide(){
        
    }
}
