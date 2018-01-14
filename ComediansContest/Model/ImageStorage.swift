//
//  ImageStorage.swift
//  ComediansContest
//

import Photos
import FirebaseStorage

protocol FirebaseStorage {
    func upload(url: URL, completeHandler: @escaping (URL?, Error?) -> Void)
}

let IMAGE_PATH: String = "image/"

class ImageStorage: FirebaseStorage {

    private let storageRef: StorageReference

    init() {
        storageRef = Storage.storage().reference()
    }

    static let sharedInstance: ImageStorage = {
        let instance = ImageStorage()
        return instance
    }()

    func upload(url: URL, completeHandler: @escaping (URL?, Error?) -> Void) {
        let assets: PHFetchResult = PHAsset.fetchAssets(withALAssetURLs: [url], options: nil)
        let asset = assets.firstObject
        asset?.requestContentEditingInput(with: nil, completionHandler: { contentEditingInput, _ in
            let imageFile = contentEditingInput?.fullSizeImageURL
            // TODO: user id add file path
            let filePath: String = "\(IMAGE_PATH)\(Date.timeIntervalSinceReferenceDate * 1000)/\(imageFile!.lastPathComponent)"
            self.storageRef.child(filePath).putFile(from: imageFile!, metadata: nil, completion: { metadata, error in
                if let error = error {
                    print(error)
                    completeHandler(nil, error)
                } else {
                    guard let downloadURL = metadata!.downloadURL() else {
                        completeHandler(nil, nil)
                        return
                    }
                    print(downloadURL)
                    completeHandler(downloadURL, nil)
                }
            })
        })
    }
}
