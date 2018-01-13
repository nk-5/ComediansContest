//
//  VideoStorage.swift
//  ComediansContest
//

import Photos
import FirebaseStorage

let VIDEO_PATH: String = "video/"

class VideoStorage {
    private let storageRef: StorageReference

    init() {
        storageRef = Storage.storage().reference()
    }

    static let sharedInstance: VideoStorage = {
        let instance = VideoStorage()
        return instance
    }()

    func upload(url: URL) {

        let filePath: String = "\(VIDEO_PATH)\(Date.timeIntervalSinceReferenceDate * 1000)/\(url.lastPathComponent)"
        storageRef.child(filePath).putFile(from: url, metadata: nil, completion: { metadata, error in
            if let error = error {
                print(error)
            } else {
                // TODO: success and move feed
                // error handling
                let downloadURL = metadata!.downloadURL()
                print(downloadURL)
            }
        })
    }
}
