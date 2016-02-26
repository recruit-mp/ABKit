//
//  VersionWeightSpec.swift
//  ABKit
//
//  Created by Masato OSHIMA on 2016/02/12.
//  Copyright © 2016年 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Quick
import Nimble
@testable import ABKit

class VersionWeightSpec: QuickSpec {
    
    override func spec() {
        describe("VersionWeight") {
            
            it("check if contains number") {
                let version = Version(name: "name", behavior: { _ in })
                let versionWeight = VersionWeight(version: version, weight: 0)
                expect(versionWeight.contains(99)).to(beTrue())
                expect(versionWeight.contains(100)).to(beFalse())
            }
        }
    }
}