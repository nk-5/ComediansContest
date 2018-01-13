//
//  ImageStorage.swift
//  ComediansContest
//

import Photos
import FirebaseStorage

let IMAGE_PATH: String = "image/"

class ImageStorage {

    private let storageRef: StorageReference

    init() {
        storageRef = Storage.storage().reference()
    }

    static let sharedInstance: ImageStorage = {
        let instance = ImageStorage()
        return instance
    }()

    func upload(url: URL) {
        // error handling

        let assets: PHFetchResult = PHAsset.fetchAssets(withALAssetURLs: [url], options: nil)
        let asset = assets.firstObject
        asset?.requestContentEditingInput(with: nil, completionHandler: { contentEditingInput, _ in
            let imageFile = contentEditingInput?.fullSizeImageURL
            // TODO: user id add file path
            let filePath: String = "\(IMAGE_PATH)\(Date.timeIntervalSinceReferenceDate * 1000)/\(imageFile!.lastPathComponent)"
            self.storageRef.child(filePath).putFile(from: imageFile!, metadata: nil, completion: { metadata, error in
                if let error = error {
                    print(error)
                } else {
                    let downloadURL = metadata!.downloadURL()
                    print(downloadURL)
                }
            })
        })
    }
}
