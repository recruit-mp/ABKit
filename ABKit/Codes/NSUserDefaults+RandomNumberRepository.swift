//
//  NSUserDefaults+RandomNumberRepository.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

extension NSUserDefaults: RandomNumberRepository {
    public func ab_getRandomNumberWithKey(key: String) -> Int {
        var randomNumber = integerForKey(key)
        if randomNumber == 0 {
            randomNumber = generateRandomNumber()
            setInteger(randomNumber, forKey: key)
        }
        return randomNumber
    }
    
    public func ab_setRandomNumber(randomNumber: Int, key: String) {
        setInteger(randomNumber, forKey: key)
    }
    
    public func ab_deleteRandomNumberWithKey(key: String) {
        removeObjectForKey(key)
    }
}
