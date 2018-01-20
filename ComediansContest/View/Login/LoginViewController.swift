//
//  LoginViewController.swift
//  ComediansContest
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var facebookButtonField: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let facebookLoginButton: LoginButton = LoginButton(readPermissions: [.publicProfile])
        facebookLoginButton.delegate = self
        facebookButtonField.addSubview(facebookLoginButton)
    }

    func loginButtonDidCompleteLogin(_: LoginButton, result: LoginResult) {
        switch result {
        case let .success(grantedPermissions: grantedPermissions, declinedPermissions: declinedPermissions, token: accessToken):
            print("login")
            print(grantedPermissions)
            print(declinedPermissions)
            print(accessToken)
        case .cancelled:
            print("cancel")
        case let .failed(error):
            print(error)
        }
    }

    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print(loginButton)
    }
}
