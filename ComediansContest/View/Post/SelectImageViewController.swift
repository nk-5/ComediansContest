//
//  SelectImageViewController.swift
//  ComediansContest
//

import UIKit
import AVKit
import Presentr

class SelectImageViewController: UIViewController {

    @IBOutlet weak var mediaView: UIView!

    let postVM: PostViewModel = PostViewModel()

    var selectedImage: UIImage?
    var selectedVideoURL: URL?
    var navigationBarRect: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        let upload: UIBarButtonItem = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(didTouchUpload))

        if let image = selectedImage {
            navigationItem.rightBarButtonItem = upload

            let imageView: UIImageView = UIImageView(frame: getImageFrameSize(imageSize: image.size))

            imageView.image = image
            mediaView.addSubview(imageView)
        } else {
            guard let videoURL = selectedVideoURL else { return }
            guard let navigationBarRect = navigationBarRect else { return }

            let navigationBar: UINavigationBar = UINavigationBar(frame: navigationBarRect)
            let navigationItem: UINavigationItem = UINavigationItem()
            let cancel: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTouchCancel))
            navigationItem.rightBarButtonItem = upload
            navigationItem.leftBarButtonItem = cancel
            navigationBar.setItems([navigationItem], animated: true)
            view.addSubview(navigationBar)

            let player: AVPlayer = AVPlayer(url: videoURL)
            let playerView: AVPlayerViewController = AVPlayerViewController()
            playerView.player = player
            playerView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: mediaView.frame.height)
            addChildViewController(playerView)
            mediaView.addSubview(playerView.view)
            playerView.didMove(toParentViewController: self)
        }
    }

    func getImageFrameSize(imageSize: CGSize) -> CGRect {
        if imageSize.width > UIScreen.main.bounds.width &&
            imageSize.height > mediaView.frame.height {
            return CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: mediaView.frame.height)
        }

        return CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
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

    @objc func didTouchCancel() {
        print("cancel")
        dismiss(animated: true, completion: nil)
    }

    func upload() {
        // TODO: upload image
        print("upload")
        guard let contentURL: URL = selectedVideoURL else { return }
        postVM.upload(url: contentURL)
    }
}
