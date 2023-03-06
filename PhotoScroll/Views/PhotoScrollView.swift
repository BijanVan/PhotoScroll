//
//  PhotoScrollView.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-03-04.
//

import UIKit

class PhotoScrollView: UIScrollView {
    let imageView = UIImageView()
    let photoName: String
    var isMinZoomScaleSet = false

    var imageViewTopConstraint = NSLayoutConstraint()
    var imageViewLeadingConstraint = NSLayoutConstraint()
    var imageViewBottomConstraint = NSLayoutConstraint()
    var imageViewTrailingConstraint = NSLayoutConstraint()

    init(photoName: String) {
        self.photoName = photoName
        super.init(frame: .zero)

        prepareSubviews()
        styleSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overrides
    override func layoutSubviews() {
        super.layoutSubviews()

        if !isMinZoomScaleSet {
            isMinZoomScaleSet = true
            updateMinZoomScale()
        }
    }

    // MARK: Private functions
    private func prepareSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)

        imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: topAnchor)
        imageViewLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        imageViewBottomConstraint = imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        imageViewTrailingConstraint = imageView.trailingAnchor.constraint(equalTo: trailingAnchor)

        imageViewTopConstraint.isActive = true
        imageViewLeadingConstraint.isActive = true
        imageViewBottomConstraint.isActive = true
        imageViewTrailingConstraint.isActive = true
    }

    private func styleSubviews() {
        imageView.image = UIImage(named: photoName)

        delegate = self
    }

    private func updateMinZoomScale() {
        let size = bounds.size
        let imageWidth = imageView.bounds.width
        let imageHeight = imageView.bounds.height
        let widthScale = size.width / imageWidth
        let heightScale = size.height / imageHeight
        let minScale = min(widthScale, heightScale)

        minimumZoomScale = minScale
        zoomScale = minScale
    }

}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct PhotoScrollView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                return PhotoScrollView(photoName: "photo4")
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
