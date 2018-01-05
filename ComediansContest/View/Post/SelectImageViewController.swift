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
        let next: UIBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(didTouchNext))
        navigationItem.rightBarButtonItem = next

        if let image = selectedImage {
            imageView.image = image
        }
    }

    @objc func didTouchNext() {
        print("next")
    }
}
