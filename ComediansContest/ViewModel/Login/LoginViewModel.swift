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
                guard let user = user else { return }
                User.insert(id: user.uid, name: user.displayName!)
                print(user.displayName)
                print(user.email)
            }
        })
    }
}
