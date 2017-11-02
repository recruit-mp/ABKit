//
//  NSUserDefaults+RandomNumberRepositorySpec.swift
//  ABKit
//
//  Created by Masato OSHIMA on 2016/02/12.
//  Copyright © 2016年 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Quick
import Nimble
@testable import ABKit

class NSUserDefaultsRandomNumberRepositorySpec: QuickSpec {
    
    override func spec() {
        describe("NSUserDefaults+RandomNumberRepository") {
            
            it("ab_getRandomNumberWithKey") {
                let defaults = UserDefaults.standard
                let random = defaults.ab_getRandomNumberWithKey("test")
                expect(random).to(beGreaterThanOrEqualTo(0))
                expect(random).to(beLessThanOrEqualTo(100))
            }
        }
    }
    
}
