//
//  FeedSectionController.swift
//  ComediansContest
//

import UIKit
import IGListKit
import AVKit

class FeedSectionController: ListSectionController {

    var feed: Feed?

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at _: Int) -> CGSize {
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 430)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil") }
        switch feed.content.type {
        case .image:
            let cell: FeedImageCell = collectionContext?.dequeueReusableCell(withNibName: "FeedImageCell", bundle: nil, for: self, at: index) as! FeedImageCell
            cell.userName.text = feed.user.name
            cell.imageView.image = feed.content.image
            cell.title.text = feed.content.title
            return cell
        case .video:
            let cell: FeedVideoCell = collectionContext?.dequeueReusableCell(withNibName: "FeedVideoCell", bundle: nil, for: self, at: index) as! FeedVideoCell
            cell.userName.text = feed.user.name
            cell.title.text = feed.content.title

            let asset: NSDataAsset = NSDataAsset(name: "movie")!
            let videoURL: URL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("gacky-movie.mov")
            try! asset.data.write(to: videoURL)

            let player: AVPlayer = AVPlayer(url: videoURL)
            let playerView: AVPlayerViewController = AVPlayerViewController()
            playerView.player = player
            playerView.view.frame = CGRect(x: cell.video.frame.origin.x, y: cell.video.frame.origin.y - cell.userName.frame.origin.y, width: UIScreen.main.bounds.width, height: cell.video.frame.height)
            viewController?.addChildViewController(playerView)
            cell.addSubview(playerView.view)
            playerView.didMove(toParentViewController: viewController)

            return cell
        }
    }

    override func didUpdate(to object: Any) {
        feed = object as? Feed
    }

    override func didSelectItem(at index: Int) {
        print(index)
    }
}
