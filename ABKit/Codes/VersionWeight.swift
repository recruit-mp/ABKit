//
//  VersionWeight.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

struct VersionWeight {
    let version: Version
    let weight: Int
    var weightRange: Range<Int> = 0..<100
    
    init(version: Version, weight: Int) {
        self.version = version
        self.weight = weight
    }
    
    func contains(number: Int) -> Bool {
        return weightRange.contains(number)
    }
}
