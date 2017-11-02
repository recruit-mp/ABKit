//
//  Version.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

open class Version {
    open let name: String
    let behavior: (Version) -> Void
    
    public init(name: String, behavior: @escaping (Version) -> Void) {
        self.name = name
        self.behavior = behavior
    }
}
