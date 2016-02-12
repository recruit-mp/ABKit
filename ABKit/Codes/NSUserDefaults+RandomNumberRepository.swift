//
//  NSUserDefaults+RandomNumberRepository.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

extension NSUserDefaults: RandomNumberRepository {
    func ab_getRandomNumberWithKey(key: String) -> Int {
        var randomNumber = integerForKey(key)
        if randomNumber == 0 {
            randomNumber = generateRandomNumber()
            setInteger(randomNumber, forKey: key)
        }
        return randomNumber
    }
}
