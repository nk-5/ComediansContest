//
//  SelectImageViewController.swift
//  ComediansContest
//

import UIKit

class SelectImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        let next: UIBarButtonItem = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(didTouchUpload))
        navigationItem.rightBarButtonItem = next

        if let image = selectedImage {
            imageView.image = image
        }
    }

    @objc func didTouchUpload() {
    }
}
