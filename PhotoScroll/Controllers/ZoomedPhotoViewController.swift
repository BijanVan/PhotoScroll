//
//  ZoomedPhotoViewController.swift
//  PhotoScroll
//
//  Created by Bijan Nazem on 2023-02-27.
//

import UIKit

class ZoomedPhotoViewController: UIViewController {
    let photoScrollView: PhotoScrollView
    let label = UILabel()
    let textField = UITextField()
    let stackView = UIStackView()
    var stackViewBottomConstraint = NSLayoutConstraint()

    init(photoName: String) {
        photoScrollView = PhotoScrollView(photoName: photoName)
        super.init(nibName: nil, bundle: nil)
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

//    override func viewWillAppear(_ animated: Bool) {
//        stackViewBottomConstraint.isActive = true
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        stackViewBottomConstraint.isActive = false
//    }

    // MARK: Private functions
    private func prepareSubviews() {
        photoScrollView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        stackView.addArrangedSubview(photoScrollView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: guide.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
        ])

        stackViewBottomConstraint = view.keyboardLayoutGuide.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1.0)
        stackViewBottomConstraint.isActive = true
    }

    private func styleSubviews() {
        view.backgroundColor = .systemBackground

        photoScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:))))

        label.text = "What name fits me best?"
        label.textAlignment = .center

        textField.placeholder = "Enter the name here"
        textField.backgroundColor = .systemBackground
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center

        stackView.axis = .vertical
        stackView.spacing = defaultSpacing
    }

    @objc private func hideKeyboard(_ sender: AnyObject) {
        textField.endEditing(true)
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct ZoomedPhotoViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                ZoomedPhotoViewController(photoName: "photo4")
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
