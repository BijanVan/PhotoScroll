//
//  CollectionViewController+DataSource.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-02-26.
//

import UIKit

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let image = UIImage(named: photos[indexPath.row])
        cell.imageView.image = image?.preparingThumbnail(of: thumbnailSize)

        return cell
    }
}
