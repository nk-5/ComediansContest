//
//  LoginViewController.swift
//  ComediansContest
//

import UIKit
import FacebookLogin
import FacebookCore
import TwitterKit

class LoginViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var facebookButtonField: UIView!
    @IBOutlet weak var twitterButtonField: UIView!

    let loginVM: LoginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Facebook login Button
        let facebookLoginButton: LoginButton = LoginButton(readPermissions: [.publicProfile, .email])
        facebookLoginButton.delegate = self
        facebookButtonField.addSubview(facebookLoginButton)

        // Twitter login Button
        let twitterLoginButton = TWTRLogInButton(logInCompletion: { session, error in
            if session != nil {
                print("success")
            } else {
                print("failed: \(error)")
            }
        })
        twitterLoginButton.frame = CGRect(x: 0, y: 0, width: twitterButtonField.frame.width, height: twitterButtonField.frame.height)
        twitterButtonField.addSubview(twitterLoginButton)
    }

    // Facebook login
    func loginButtonDidCompleteLogin(_: LoginButton, result: LoginResult) {
        switch result {
        case let .success(grantedPermissions: grantedPermissions, declinedPermissions: declinedPermissions, token: accessToken):
            print("login")
            print(grantedPermissions)
            print(declinedPermissions)
            print(accessToken)
            loginVM.authLogin(accessToken: accessToken.authenticationToken)
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
