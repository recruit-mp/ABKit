//
//  RootViewController.swift
//  Example
//
//  Created by Yuki Hirai on 2016/02/26.
//  Copyright © 2016年 Recruit Marketing Partners. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            performSegueWithIdentifier("showCollectionView", sender: self)
        case 1:
            performSegueWithIdentifier("showTableView", sender: self)
        default:
            break
        }
    }
}

