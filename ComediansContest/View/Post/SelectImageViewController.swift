//
//  SelectImageViewController.swift
//  ComediansContest
//

import UIKit

class SelectImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var selectedImage: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage {
            imageView.image = image
        }
    }
}
