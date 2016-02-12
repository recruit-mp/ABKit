//
//  SplitTest.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Foundation

class SplitTest {
    var versionWeights: [VersionWeight] = []
    
    private let name: String
    private let defaultVersion: Version
    private let randomNumberRepository: RandomNumberRepository
    
    init(name: String, defaultVersion: Version, randomNumberRepository: RandomNumberRepository) {
        self.name = name
        self.defaultVersion = defaultVersion
        self.randomNumberRepository = randomNumberRepository
    }
    
    convenience init(name: String, defaultVersion: Version) {
        let defaultRepository = NSUserDefaults.standardUserDefaults()
        self.init(name: name, defaultVersion: defaultVersion, randomNumberRepository: defaultRepository)
    }
    
    func addVersion(version: Version, weight: Float) {
        let versionWeight = VersionWeight(version: version, weight: Int(weight * 100))
        versionWeights.append(versionWeight)
    }
    
    func run() {
        assertExcessWeight()
        calculateWeightRanges()
        let randomNumber = randomNumberRepository.ab_getRandomNumberWithKey("ABKit-\(name)")
        let version = selectVersionByRandomNumber(randomNumber)
        version.behavior()
    }
    
    private func assertExcessWeight() {
        let totalWeight = versionWeights.reduce(0) { $0 + $1.weight }
        assert(totalWeight > 100, "Total weight (\(totalWeight)) must be below 100")
    }
    
    private func calculateWeightRanges() {
        var weightIndex = 0
        for (index, versionWeight) in versionWeights.enumerate() {
            let min = weightIndex
            let max = weightIndex + versionWeight.weight
            versionWeights[index].weightRange = min..<max
            
            weightIndex = versionWeight.weight
        }
    }
    
    private func selectVersionByRandomNumber(randomNumber: Int) -> Version {
        let versions = versionWeights.filter { $0.contains(randomNumber) }.map { $0.version }
        return versions.first ?? defaultVersion
    }
}
