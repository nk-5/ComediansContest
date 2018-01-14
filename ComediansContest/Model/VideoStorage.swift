//
//  VideoStorage.swift
//  ComediansContest
//

import Photos
import FirebaseStorage

let VIDEO_PATH: String = "video/"

class VideoStorage: FirebaseStorage {
    private let storageRef: StorageReference

    init() {
        storageRef = Storage.storage().reference()
    }

    static let sharedInstance: VideoStorage = {
        let instance = VideoStorage()
        return instance
    }()

    func upload(url: URL, completeHandler: @escaping (URL?, Error?) -> Void) {
        let filePath: String = "\(VIDEO_PATH)\(Date.timeIntervalSinceReferenceDate * 1000)/\(url.lastPathComponent)"
        storageRef.child(filePath).putFile(from: url, metadata: nil, completion: { metadata, error in
            if let error = error {
                completeHandler(nil, error)
            } else {
                let downloadURL = metadata!.downloadURL()
                completeHandler(downloadURL, nil)
            }
        })
    }
}
