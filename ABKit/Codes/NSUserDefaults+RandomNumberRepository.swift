//
//  NSUserDefaults+RandomNumberRepository.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/12/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

extension UserDefaults: RandomNumberRepository {
    public func ab_getRandomNumberWithKey(_ key: String) -> Int {
        var randomNumber = integer(forKey: key)
        if randomNumber == 0 {
            randomNumber = generateRandomNumber()
            set(randomNumber, forKey: key)
        }
        return randomNumber
    }
    
    public func ab_setRandomNumber(_ randomNumber: Int, key: String) {
        set(randomNumber, forKey: key)
    }
    
    public func ab_deleteRandomNumberWithKey(_ key: String) {
        removeObject(forKey: key)
    }
}
