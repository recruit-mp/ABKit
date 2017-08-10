//
//  ImageTableViewController.swift
//  Example
//
//  Created by Yuki Hirai on 2016/02/26.
//  Copyright © 2016年 Recruit Marketing Partners. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {
    enum CellType: String {
        case Left, Right
    }

    fileprivate var imageNames: [String]?
    var cellType = CellType.Left

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 66.0
        tableView.rowHeight = UITableViewAutomaticDimension
        setupData()
    }

    fileprivate func setupData() {
        // We prepared 16 images for example
        var imageNames = [String]()
        for i in 1...16 {
            let imageName = String(format: "%02d_S.jpeg", arguments: [i])
            imageNames.append(imageName)
        }
        self.imageNames = imageNames
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)

        if let imageCell = cell as? ImageTableViewCell, let imageName = imageNames?[indexPath.row] {
            imageCell.imageName = imageName
        }

        return cell
    }
}
