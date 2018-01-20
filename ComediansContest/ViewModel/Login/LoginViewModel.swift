//
//  LoginViewModel.swift
//  ComediansContest
//

import Firebase

class LoginViewModel {
    func authLogin(accessToken: String) {
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        Auth.auth().signIn(with: credential, completion: { user, error in
            if let error = error {
                print(error)
                return
            } else {
                print(user?.displayName)
                print(user?.email)
            }
        })
    }
}
