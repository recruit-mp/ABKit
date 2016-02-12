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
                expect(splitTest.versions.count).to(equal(1))
                expect(splitTest.versions.first).toNot(beNil())
                expect(splitTest.versions.first!.name).to(equal(defaultVersion.name))
            }
            
            it("create SplitTest") {
                let randomNumberRepository = TestRandomNumberRepository()
                let defaultVersion = Version(name: "name", behavior: {})
                let splitTest = SplitTest(name: "name", defaultVersion: defaultVersion, randomNumberRepository: randomNumberRepository)
                expect(splitTest.versions.count).to(equal(1))
                expect(splitTest.versions.first).toNot(beNil())
                expect(splitTest.versions.first!.name).to(equal(defaultVersion.name))
            }
        }
    }
}

class TestRandomNumberRepository: RandomNumberRepository {
    
    func ab_getRandomNumberWithKey(key: String) -> Int {
        return 1
    }
}
