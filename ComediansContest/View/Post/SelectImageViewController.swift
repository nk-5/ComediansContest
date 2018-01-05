//
//  SelectImageViewController.swift
//  ComediansContest
//

import UIKit
import Presentr

class SelectImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        let next: UIBarButtonItem = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(didTouchUpload))
        navigationItem.rightBarButtonItem = next

        if let image = selectedImage {
            let multiplier: CGFloat = image.size.height / image.size.width
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: multiplier).isActive = true
            imageView.image = image
        }
    }

    @objc func didTouchUpload() {
        let alertView = Presentr.alertViewController(title: "Would you like to post it?", body: "")
        let cancel = AlertAction(title: "cancel", style: .destructive, handler: nil)
        let upload = AlertAction(title: "upload", style: .default, handler: { [weak self] _ in
            guard let weakSelf = self else {
                // TODO: error handling
                return
            }
            weakSelf.upload()
        })

        alertView.addAction(cancel)
        alertView.addAction(upload)

        let presenter = Presentr(presentationType: .alert)

        customPresentViewController(presenter, viewController: alertView, animated: true, completion: nil)
    }

    func upload() {
        // TODO: upload image
        print("upload")
    }
}
