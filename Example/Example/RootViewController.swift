//
//  RootViewController.swift
//  Example
//
//  Created by Yuki Hirai on 2016/02/26.
//  Copyright © 2016年 Recruit Marketing Partners. All rights reserved.
//

import UIKit
import ABKit

class RootViewController: UITableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            runABTest()
        case 1:
            runWeightedProbabilitiesSplitTest()
        default:
            runConditionalTest()
            break
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.destinationViewController {
        case let viewController as ImageTableViewController:
            if segue.identifier == "showRightImageTableView" {
                viewController.cellType = .Right
            }
            break
        default:
            break
        }
    }

    private func runABTest() {
        let defaultVersion = Version(name: "A") { version in
            print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showImageTableView", sender: self)
        }

        let test = SplitTest(name: "Sample A/B test", defaultVersion: defaultVersion)

        let b = Version(name: "B") { version in
            print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showImageCollectionView", sender: self)
        }
        test.addVersion(b, weight: 0.5)

        test.run()
    }

    private func runWeightedProbabilitiesSplitTest() {
        let defaultVersion = Version(name: "A") { version in
            print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showImageTableView", sender: self)
        }

        let test = SplitTest(name: "Sample Split test", defaultVersion: defaultVersion)

        let b = Version(name: "B") { version in
            print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showImageCollectionView", sender: self)
        }
        test.addVersion(b, weight: 0.2)

        let c = Version(name: "C") { version in
            print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showRightImageTableView", sender: self)
        }
        test.addVersion(c, weight: 0.3)

        test.run()
    }

    private func runConditionalTest() {
        let defaultVersion = Version(name: "A") {
            version in print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showImageTableView", sender: self)
        }

        let test = ConditionalTest<Int>(name: "Sample conditional test", defaultVersion: defaultVersion)

        let b = Version(name: "B") { version in
            print("Pattern \(version.name)")
            self.performSegueWithIdentifier("showImageCollectionView", sender: self)
        }
        test.addVersion(b) { age in age < 20 }

        let age = 28
        test.run(age)
    }
}
