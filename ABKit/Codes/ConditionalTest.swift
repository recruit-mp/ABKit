//
//  ConditionalTest.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/26/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

public class ConditionalTest<T> {
    public let name: String
    public let defaultVersion: Version
    
    private var versions: [ConditionalVersion<T>] = []
    
    public init(name: String, defaultVersion: Version) {
        self.name = name
        self.defaultVersion = defaultVersion
    }
    
    public func addVersion(version: Version, condition: (T) -> Bool) {
        let conditionalVersion = ConditionalVersion(name: version.name, behavior: version.behavior, condition: condition)
        versions.append(conditionalVersion)
    }
    
    public func run(value: T) {
        var isRun = false
        for version in versions {
            if version.condition(value) {
                version.behavior(version)
                isRun = true
                break
            }
        }
        
        if !isRun {
            defaultVersion.behavior(defaultVersion)
        }
    }
}
