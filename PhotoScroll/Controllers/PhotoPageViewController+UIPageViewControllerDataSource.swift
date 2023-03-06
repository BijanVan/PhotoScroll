//
//  PhotoPageViewController+UIPageViewControllerDataSource.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-03-05.
//

import UIKit

extension PhotoPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        index = (photos.count - index + 1) % photos.count
        return ZoomedPhotoViewController(photoName: photos[index])
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        index = (index + 1) % photos.count
        return ZoomedPhotoViewController(photoName: photos[index])
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        photos.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        index
    }
}
