//
//  PostViewController.swift
//  ComediansContest
//

import UIKit
import Photos

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePickerController: UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController = UIImagePickerController()
        // TODO:
        // photo library's data show in collection view
        // PHAuthorization status check
        // https://dev.classmethod.jp/references/ios8-photo-kit-7/
        // Camera sample code
        // https://developer.apple.com/library/content/samplecode/PhotoPicker/Listings/PhotoPicker_APLViewController_m.html

        // get images from photo library
        //        let momentLists: PHFetchResult = PHCollectionList.fetchCollectionLists(with: .momentList, subtype: .any, options: nil)
        //        let folderLists: PHFetchResult = PHCollectionList.fetchCollectionLists(with: .folder, subtype: .any, options: nil)
        //        let smartFolderList: PHFetchResult = PHCollectionList.fetchCollectionLists(with: .smartFolder, subtype: .any, options: nil)
        //
        //        print(momentLists)
        //        print(folderLists)
        //        print(smartFolderList)
        //
        //        momentLists.enumerateObjects({ momentCollectionList, _, _ in
        //            print(momentCollectionList)
        //
        //            let moments: PHFetchResult = PHAssetCollection.fetchMoments(inMomentList: momentCollectionList, options: nil)
        //
        //            moments.enumerateObjects({ momentAssetCollection, _, _ in
        //                let assets: PHFetchResult = PHAsset.fetchAssets(in: momentAssetCollection, options: nil)
        //                print(assets)
        //
        //                assets.enumerateObjects({ asset, _, _ in
        //
        //                    PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: nil, resultHandler: { result, info in
        //                        print(result)
        //                        print(info)
        //                        let imageView: UIImageView = UIImageView(image: result)
        //                        self.view.addSubview(imageView)
        //                    })
        //                })
        //            })
        //        })
    }

    @IBAction func didTouchLibrary(_: Any) {
        //        imagePickerController.sourceType = UIImage
    }
}
