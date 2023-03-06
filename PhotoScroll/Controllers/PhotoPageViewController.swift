//
//  PhotoPageViewController.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-03-05.
//

import UIKit

class PhotoPageViewController: UIPageViewController {
    let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var index: Int

    init(index: Int) {
        self.index = index
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
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


    // MARK: Private functions
    private func prepareSubviews() {
    }

    private func styleSubviews() {
        dataSource = self
        let viewController = ZoomedPhotoViewController(photoName: photos[index])
        setViewControllers([viewController], direction: .forward, animated: false)
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .systemGray

    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct PhotoPageViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                PhotoPageViewController(index: 0)
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif


