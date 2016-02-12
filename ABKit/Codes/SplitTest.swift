//
//  SplitTest.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Foundation

class SplitTest {
    var versions: [Version] = []
    
    private let name: String
    private let defaultVersion: Version
    private let randomNumberRepository: RandomNumberRepository
    
    init(name: String, defaultVersion: Version, randomNumberRepository: RandomNumberRepository) {
        self.name = name
        self.defaultVersion = defaultVersion
        self.randomNumberRepository = randomNumberRepository
        
        addVersion(defaultVersion)
    }
    
    convenience init(name: String, defaultVersion: Version) {
        let defaultRepository = NSUserDefaults.standardUserDefaults()
        self.init(name: name, defaultVersion: defaultVersion, randomNumberRepository: defaultRepository)
    }
    
    func addVersion(version: Version) {
        versions.append(version)
    }
    
    func run() {
        let randomNumber = randomNumberRepository.ab_getRandomNumberWithKey("ABKit-\(name)")
        let versionRanges = buildVersionRanges()
        let version = selectVersionByNumber(randomNumber, versionRanges: versionRanges)
        version.behavior()
    }
    
    private func buildVersionRanges() -> [VersionRange] {
        let rangeLength = 100 / versions.count
        
        var versionRanges: [VersionRange] = []
        for (index, version) in versions.enumerate() {
            let min = rangeLength * index
            let max = rangeLength * (index + 1)
            let versionRange = VersionRange(range: min..<max, version: version)
            versionRanges.append(versionRange)
        }
        
        return versionRanges
    }
    
    private func selectVersionByNumber(number: Int, versionRanges: [VersionRange]) -> Version {
        let versions = versionRanges.filter { $0.range.contains(number) }.map { $0.version }
        return versions.first ?? defaultVersion
    }
}
