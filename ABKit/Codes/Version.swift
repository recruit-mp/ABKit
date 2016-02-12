//
//  Version.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

public struct Version {
    let name: String
    let behavior: () -> Void
    
    public init(name: String, behavior: () -> Void) {
        self.name = name
        self.behavior = behavior
    }
}
