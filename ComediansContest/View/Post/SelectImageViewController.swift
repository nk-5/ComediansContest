//
//  SelectImageViewController.swift
//  ComediansContest
//

import UIKit
import ZFDragableModalTransition

class SelectImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var selectedImage: UIImage?
    var animator: ZFModalTransitionAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        let next: UIBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(didTouchNext))
        navigationItem.rightBarButtonItem = next

        if let image = selectedImage {
            imageView.image = image
        }
    }

    @objc func didTouchNext() {
        let postFormVC: PostFormViewController = storyboard?.instantiateViewController(withIdentifier: "postFormVC") as! PostFormViewController
        animator = ZFModalTransitionAnimator(modalViewController: postFormVC)
        animator?.direction = ZFModalTransitonDirection.bottom

        postFormVC.transitioningDelegate = animator
        postFormVC.modalPresentationStyle = .custom
        present(postFormVC, animated: true, completion: nil)
    }
}
