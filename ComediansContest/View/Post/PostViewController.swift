//
//  PostViewController.swift
//  ComediansContest
//

import UIKit
import Photos

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let postVM: PostViewModel = PostViewModel()

    var imagePickerController: UIImagePickerController?
    var navigationBarRect: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()

        postVM.authFirebase()

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
        guard let imagePickerController = imagePickerController else { return }
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    // MARK: UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, didShow _: UIViewController, animated _: Bool) {
        if navigationBarRect == nil {
            // use Video upload form viewController
            navigationBarRect = navigationController.navigationBar.frame
        }
    }

    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        print(info)
        guard let mediaType: String = info[UIImagePickerControllerMediaType] as? String else { return }
        let vc: SelectImageViewController = storyboard?.instantiateViewController(withIdentifier: "selectImageView") as! SelectImageViewController
        switch mediaType {
        case "public.image":
            guard let image: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
            guard let imageURL: URL = info[UIImagePickerControllerReferenceURL] as? URL else { return }
            vc.selectedImage = image
            vc.selectedVideoURL = imageURL
            break
        case "public.movie":
            guard let videoURL: URL = info[UIImagePickerControllerMediaURL] as? URL else { return }
            vc.selectedVideoURL = videoURL
            vc.navigationBarRect = navigationBarRect
            break
        default:
            break
        }

        picker.show(vc, sender: nil)
    }
}
