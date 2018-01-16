//
//  LoginViewController.swift
//  ComediansContest
//

import UIKit
import FacebookLogin

import PopupDialog

class LoginViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var facebookButtonField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let facebookLoginButton: LoginButton = LoginButton.init(readPermissions: [.publicProfile])
        facebookLoginButton.delegate = self
        facebookLoginButton.addSubview(facebookLoginButton)
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case let .success(grantedPermissions: grantedPermissions, declinedPermissions: declinedPermissions, token: accessToken):
            print("login")
            print(grantedPermissionsb)
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
