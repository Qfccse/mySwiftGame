//
//  GameSceneController.swift
//  myGame
//
//  Created by macos on 2022/12/05.
//  Copyright  2022 macos. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    func resetGame() {
        if let scene = GameScene(fileNamed: "GameScene") {
            // 配置视图
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.showsPhysics = false
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func prefersStatusBarHidden() -> Bool {
        return true
    }
}
