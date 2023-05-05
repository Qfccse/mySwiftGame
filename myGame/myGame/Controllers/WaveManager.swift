//
//  WaveManager.swift
//  myGame
//
//  Created by macos on 2022/12/09.
//  Copyright  2022 macos. All rights reserved.
//

import Foundation

struct Wave {
    let dinosaurCount: Int
    let dinosaurDelay: Double
    let dinosaurType: DinosaurType
}

class WaveManager {
    var currentWave = 0
    var currentWaveDinosaurCount = 0
    let waves: [Wave]
    let newWaveHandler: (_ waveNum: Int) -> Void
    let newDinosaurHandler: (_ mobType: DinosaurType) -> Void

    init(waves: [Wave],
         newWaveHandler: @escaping (_ waveNum: Int) -> Void,
         newDinosaurHandler: @escaping (_ dinosaurType: DinosaurType) -> Void) {
        self.waves = waves
        self.newWaveHandler = newWaveHandler
        self.newDinosaurHandler = newDinosaurHandler
    }

    // 产生下一波
    @discardableResult func startNextWave() -> Bool {
        if waves.count <= currentWave {
            return true
        }
        self.newWaveHandler(currentWave + 1)
        let wave = waves[currentWave]
        currentWaveDinosaurCount = wave.dinosaurCount
        for m in 1...wave.dinosaurCount {
            delay(wave.dinosaurDelay * Double(m)) { self.newDinosaurHandler(wave.dinosaurType) }
        }
        currentWave += 1
        return false
    }
    // 结束本波，并产生下一波
    @discardableResult func removeDinosaurFromWave() -> Bool {
        currentWaveDinosaurCount -= 1
        if currentWaveDinosaurCount <= 0 {
            return startNextWave()
        }
        return false
    }
}
