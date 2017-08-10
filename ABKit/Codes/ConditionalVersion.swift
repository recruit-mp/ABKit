//
//  ConditionalVersion.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/26/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

class ConditionalVersion<T>: Version {
    let condition: (T) -> Bool
    
    init(name: String, behavior: @escaping (Version) -> Void, condition: @escaping (T) -> Bool) {
        self.condition = condition
        super.init(name: name, behavior: behavior)
    }
}
