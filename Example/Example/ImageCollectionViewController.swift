//
//  ImageCollectionViewController.swift
//  Example
//
//  Created by Yuki Hirai on 2016/02/26.
//  Copyright © 2016年 Recruit Marketing Partners. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController {
    fileprivate struct Constants {
        static let cellMargin = CGFloat(5.0)
        static let numberOfColumns = 2
    }

    fileprivate var imageNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    fileprivate func setupData() {
        // We prepared 16 images for example
        var imageNames = [String]()
        for i in 1...16 {
            let imageName = String(format: "%02d_L.jpeg", arguments: [i])
            imageNames.append(imageName)
        }
        self.imageNames = imageNames
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageNames?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)

        if let imageCell = cell as? ImageCollectionViewCell, let imageName = imageNames?[indexPath.row] {
            imageCell.imageName = imageName
        }

        return cell
    }
}

extension ImageCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width / CGFloat(Constants.numberOfColumns) - (Constants.cellMargin * 2)

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, Constants.cellMargin, Constants.cellMargin, Constants.cellMargin)
    }
}
