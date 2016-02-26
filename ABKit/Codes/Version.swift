//
//  Version.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

public class Version {
    public let name: String
    let behavior: Version -> Void
    
    public init(name: String, behavior: Version -> Void) {
        self.name = name
        self.behavior = behavior
    }
}
