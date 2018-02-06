//
//  MypageViewController.swift
//  ComediansContest
//

import UIKit
import PopupDialog
import FirebaseAuth

class MypageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Firebase signout
        // TODO: logout login provider
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print(signOutError)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // handle use logout
        let handle: AuthStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { auth, user in
            guard let user = user else {
                self.showLoginModal()
                return
            }

            if user.isAnonymous || auth.currentUser == nil {
                self.showLoginModal()
            }
        }
    }

    func showLoginModal() {
        let loginVC: LoginViewController = LoginViewController(nibName: "LoginView", bundle: nil)
        let loginModalView = PopupDialog(viewController: loginVC, buttonAlignment: .vertical, transitionStyle: .fadeIn, hideStatusBar: true, completion: nil)
        present(loginModalView, animated: true, completion: nil)
    }
}
