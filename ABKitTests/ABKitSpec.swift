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
            
            it("create SplitTest") {
                let defaultVersion = Version(name: "name", behavior: {})
                let spritTest = SplitTest(defaultVersion: defaultVersion)
                expect(spritTest.versions.count).to(equal(1))
                expect(spritTest.versions.first).toNot(beNil())
                expect(spritTest.versions.first!.name).to(equal(defaultVersion.name))
            }
            
        }
    }
}
