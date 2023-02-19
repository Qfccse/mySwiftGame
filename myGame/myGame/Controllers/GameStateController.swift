//
//  GameStateController.swift
//  myGame
//
//  Created by macos on 2022/12/09.
//  Copyright  2022 macos. All rights reserved.
//

import Foundation
import GameplayKit

class GameSceneState: GKState {
    unowned let scene: GameScene

    init(scene: GameScene) {
        self.scene = scene
    }
}

class GameSceneReadyState: GameSceneState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == GameSceneActiveState.self
    }
}

class GameSceneActiveState: GameSceneState {
    override func didEnter(from previousState: GKState?) {
        // 关闭ready界面
        scene.showReady(show: false)
        // 开始
        scene.startFirstWave()
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == GameSceneWinState.self || stateClass == GameSceneLoseState.self
    }
}

class GameSceneWinState: GameSceneState {
    override func didEnter(from previousState: GKState?) {
        // 胜利界面
        scene.showWin()
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == GameSceneReadyState.self
    }
}

class GameSceneLoseState: GameSceneState {
    override func didEnter(from previousState: GKState?) {
        // 失败界面
        scene.showLose()
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == GameSceneReadyState.self
    }
}
