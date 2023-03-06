//
//  PhotoScrollView+UIScrollViewDelegate.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-03-03.
//

import UIKit

extension PhotoScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateImageViewConstraints()
    }

    // MARK: Private functions
    private func updateImageViewConstraints() {
        let widthOffset = (bounds.width - contentSize.width) / 2
        let heightOffset = (bounds.height - contentSize.height) / 2
        imageViewLeadingConstraint.constant = widthOffset
        imageViewTopConstraint.constant = heightOffset
    }
}
