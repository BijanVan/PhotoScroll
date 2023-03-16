//
//  CollectionViewController.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-02-26.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    let reuseIdentifier = "PhotoCell"
    let thumbnailSize = CGSize(width: 70.0, height: 70.0)
    let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
    let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareSubviews()
        styleSubviews()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = PhotoPageViewController(index: indexPath.row)
        navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: Private functions
    private func prepareSubviews() {
    }

    private func styleSubviews() {
    }

    @objc private func doneTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct CollectionViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                CollectionViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

