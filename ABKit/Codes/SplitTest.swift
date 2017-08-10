//
//  SplitTest.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Foundation

open class SplitTest {
    var versionWeights: [VersionWeight] = []
    
    fileprivate let name: String
    fileprivate let defaultVersion: Version
    fileprivate let randomNumberRepository: RandomNumberRepository
    
    public init(name: String, defaultVersion: Version, randomNumberRepository: RandomNumberRepository) {
        self.name = name
        self.defaultVersion = defaultVersion
        self.randomNumberRepository = randomNumberRepository
    }
    
    public convenience init(name: String, defaultVersion: Version) {
        let defaultRepository = UserDefaults.standard
        self.init(name: name, defaultVersion: defaultVersion, randomNumberRepository: defaultRepository as RandomNumberRepository)
    }
    
    open func addVersion(_ version: Version, weight: Float) {
        let versionWeight = VersionWeight(version: version, weight: Int(weight * 100))
        versionWeights.append(versionWeight)
    }
    
    open func run() {
        assertExcessWeight()
        calculateWeightRanges()
        let randomNumber = randomNumberRepository.ab_getRandomNumberWithKey("ABKit-\(name)")
        let version = selectVersionByRandomNumber(randomNumber)
        version.behavior(version)
    }
    
    open func setRandomNumber(_ randomNumber: Int) {
        randomNumberRepository.ab_setRandomNumber(randomNumber, key: "ABKit-\(name)")
    }
    
    open func deleteRandomNumber() {
        randomNumberRepository.ab_deleteRandomNumberWithKey("ABKit-\(name)")
    }
    
    fileprivate func assertExcessWeight() {
        let totalWeight = versionWeights.reduce(0) { $0 + $1.weight }
        assert(totalWeight <= 100, "Total weight (\(totalWeight / 100)) must be below 1.0")
    }
    
    fileprivate func calculateWeightRanges() {
        var weightIndex = 0
        for (index, versionWeight) in versionWeights.enumerated() {
            let min = weightIndex
            let max = weightIndex + versionWeight.weight
            versionWeights[index].weightRange = min..<max
            
            weightIndex = versionWeight.weight
        }
    }
    
    fileprivate func selectVersionByRandomNumber(_ randomNumber: Int) -> Version {
        let versions = versionWeights.filter { $0.contains(randomNumber) }.map { $0.version }
        return versions.first ?? defaultVersion
    }
}
