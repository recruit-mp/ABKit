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
    private let defaultVersion: Version
    
    init(defaultVersion: Version) {
        self.defaultVersion = defaultVersion
        versions.append(defaultVersion)
    }
    
    func addVersion(version: Version) {
        versions.append(version)
    }
    
    func run() {
        let random = Int(arc4random_uniform(100))
        let versionRanges = buildVersionRanges()
        let version = selectVersionByNumber(random, versionRanges: versionRanges)
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
