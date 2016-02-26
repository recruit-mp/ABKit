//
//  ImageCollectionViewController.swift
//  Example
//
//  Created by Yuki Hirai on 2016/02/26.
//  Copyright © 2016年 Recruit Marketing Partners. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController {
    private struct Constants {
        static let cellMargin = CGFloat(5.0)
        static let numberOfColumns = 2
    }

    private var imageNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    private func setupData() {
        // We prepared 16 images for example
        var imageNames = [String]()
        for i in 1...16 {
            let imageName = String(format: "%02d_L.jpeg", arguments: [i])
            imageNames.append(imageName)
        }
        self.imageNames = imageNames
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageNames?.count ?? 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath)

        if let imageCell = cell as? ImageCollectionViewCell, let imageName = imageNames?[indexPath.row] {
            imageCell.imageName = imageName
        }

        return cell
    }
}

extension ImageCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let width = CGRectGetWidth(collectionView.frame) / CGFloat(Constants.numberOfColumns) - (Constants.cellMargin * 2)

        return CGSizeMake(width, width)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, Constants.cellMargin, Constants.cellMargin, Constants.cellMargin)
    }
}