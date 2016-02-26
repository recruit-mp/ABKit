//
//  ConditionalTestSpec.swift
//  ABKit
//
//  Created by Naoto Kaneko on 2/26/16.
//  Copyright © 2016 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//

import Quick
import Nimble
@testable import ABKit

class ConditionalTestSpec: QuickSpec {
    var user = User(name: "naoty", age: 28)
    
    override func spec() {
        describe("ConditionalTest") {
            describe("-run(_:)") {
                beforeEach {
                }
                
                context("When condition is age >= 20") {
                    it("runs the conditional version") {
                        let defaultVersion = Version(name: "default") { expect(true).to(beFalse()) }
                        let test = ConditionalTest<User>(name: "sample", defaultVersion: defaultVersion)
                        
                        let version = Version(name: "Test for adults") { expect(true).to(beTrue()) }
                        test.addVersion(version) { user in user.age >= 20 }
                        test.run(self.user)
                    }
                }
                
                context("When condition is age >= 30") {
                    it("runs the default version") {
                        let defaultVersion = Version(name: "default") { expect(true).to(beTrue()) }
                        let test = ConditionalTest<User>(name: "sample", defaultVersion: defaultVersion)
                        
                        let version = Version(name: "Test for adults") { expect(true).to(beFalse()) }
                        test.addVersion(version) { user in user.age >= 30 }
                        test.run(self.user)
                    }
                }
            }
        }
    }
}
