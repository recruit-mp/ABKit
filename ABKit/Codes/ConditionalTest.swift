//
//  ConditionalTest.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/26/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

open class ConditionalTest<T> {
    open let name: String
    open let defaultVersion: Version
    
    fileprivate var versions: [ConditionalVersion<T>] = []
    
    public init(name: String, defaultVersion: Version) {
        self.name = name
        self.defaultVersion = defaultVersion
    }
    
    open func addVersion(_ version: Version, condition: @escaping (T) -> Bool) {
        let conditionalVersion = ConditionalVersion(name: version.name, behavior: version.behavior, condition: condition)
        versions.append(conditionalVersion)
    }
    
    open func run(_ value: T) {
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
