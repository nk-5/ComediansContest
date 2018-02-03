//
//  MypageViewController.swift
//  ComediansContest
//

import UIKit
import PopupDialog

class MypageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_: Bool) {
        let loginVC: LoginViewController = LoginViewController(nibName: "LoginView", bundle: nil)
        let loginModalView = PopupDialog(viewController: loginVC, buttonAlignment: .vertical, transitionStyle: .fadeIn, hideStatusBar: true, completion: nil)
        present(loginModalView, animated: true, completion: nil)
    }
}
