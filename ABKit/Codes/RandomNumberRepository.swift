//
//  RandomNumberRepository.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Foundation

public protocol RandomNumberRepository {
    func ab_getRandomNumberWithKey(_ key: String) -> Int
    func ab_setRandomNumber(_ randomNumber: Int, key: String)
    func ab_deleteRandomNumberWithKey(_ key: String)
}

extension RandomNumberRepository {
    func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(100))
    }
}
