//
//  ImageTableViewCell.swift
//  Example
//
//  Created by Yuki Hirai on 2016/02/26.
//  Copyright © 2016年 Recruit Marketing Partners. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    var imageName: String? {
        didSet {
            guard let imageName = imageName else {
                return
            }

            filenameLabel.text = imageName
            thumbImageView.image = UIImage(named: imageName)
        }
    }

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var filenameLabel: UILabel!
}
