//
//  ABKitSpec.swift
//  ABKit
//
//  Created by Masato OSHIMA on 2016/02/12.
//  Copyright © 2016年 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Quick
import Nimble
@testable import ABKit

class ABKitSpec: QuickSpec {
    
    override func spec() {
        
        describe("ABKit") {
            
            it("create SplitTest by convinience") {
                let defaultVersion = Version(name: "name", behavior: {})
                let splitTest = SplitTest(name: "name", defaultVersion: defaultVersion)
                expect(splitTest.versionWeights).to(beEmpty())
            }
            
            it("create SplitTest") {
                let randomNumberRepository = TestRandomNumberRepository()
                let defaultVersion = Version(name: "name", behavior: {})
                let splitTest = SplitTest(name: "name", defaultVersion: defaultVersion, randomNumberRepository: randomNumberRepository)
                ex
                pect(splitTest.versionWeights).to(beEmpty())
            }
        }
    }
}

class TestRandomNumberRepository: RandomNumberRepository {
    
    func ab_getRandomNumberWithKey(key: String) -> Int {
        return 1
    }
}
