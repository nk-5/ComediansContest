//
//  PostViewModel.swift
//  ComediansContest
//

import Firebase

class PostViewModel {

    // TODO: callbackで成否を返す
    func authFirebase() {
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously(completion: { user, error in
                if let error = error {
                    // error handling
                    print(error)
                } else {
                    print(user)
                }
            })
        }
    }

    // TODO: callbackで成否を返す
    // upload後のdelegateないか調べる
    func upload(url: URL, type: PostContentType) {
        switch type {
        case .image:
            ImageStorage.sharedInstance.upload(url: url)
        case .video:
            VideoStorage.sharedInstance.upload(url: url)
        }
    }
}
