//
//  PostViewController.swift
//  ComediansContest
//

import UIKit
import Photos

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let momentLists: PHFetchResult = PHCollectionList.fetchCollectionLists(with: .momentList, subtype: .any, options: nil)
        let folderLists: PHFetchResult = PHCollectionList.fetchCollectionLists(with: .folder, subtype: .any, options: nil)
        let smartFolderList: PHFetchResult = PHCollectionList.fetchCollectionLists(with: .smartFolder, subtype: .any, options: nil)

        print(momentLists)
        print(folderLists)
        print(smartFolderList)
    }
}
