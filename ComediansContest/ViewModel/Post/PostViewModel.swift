//
//  PostViewModel.swift
//  ComediansContest
//

import Firebase

protocol UploadTaskDelegate: class {
    func succeed(downloadURL: URL)
    func failed(error: Error?)
}

class PostViewModel {

    weak var delegate: UploadTaskDelegate?

    // TODO: callbackで成否を返す
    func authFirebase() {
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously(completion: { user, error in
                if let error = error {
                    // error handling
                    print(error)
                } else {
                    print(user!)
                }
            })
        }
    }

    // call from SelectImageViewController
    func upload(url: URL, type: PostContentType) {
        switch type {
        case .image:
            uploadForStorage(storage: ImageStorage.sharedInstance, url: url)
        case .video:
            uploadForStorage(storage: VideoStorage.sharedInstance, url: url)
        }
    }

    // upload for Firebase Storage
    func uploadForStorage<Storage: FirebaseStorage>(storage: Storage, url: URL) {
        storage.upload(url: url, completeHandler: { [weak self] url, error in
            guard let weakSelf = self else { return }
            weakSelf.uploadCompleteHandler(url: url, error: error)
        })
    }

    func uploadCompleteHandler(url: URL?, error: Error?) {
        guard let url = url else {
            delegate?.failed(error: error)
            return
        }

        insertContent(url: url.absoluteString)
        delegate?.succeed(downloadURL: url)
    }

    // TODO: insert content
    func insertContent(url _: String) {
        print("insert")
    }
}
