//
//  FeedSectionController.swift
//  ComediansContest
//
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
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 400)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil") }
        switch feed.content.type {
        case .image:
            let cell: FeedImageCell = collectionContext?.dequeueReusableCell(withNibName: "FeedImageCell", bundle: nil, for: self, at: index) as! FeedImageCell
            cell.userName.text = feed.user.name
            cell.imageView.image = feed.content.image
            return cell
        case .video:
            let cell: FeedVideoCell = collectionContext?.dequeueReusableCell(withNibName: "FeedVideoCell", bundle: nil, for: self, at: index) as! FeedVideoCell
            cell.userName.text = feed.user.name
            let asset: NSDataAsset = NSDataAsset(name: "movie")!
            let videoURL: URL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("gacky-movie.mov")
            try! asset.data.write(to: videoURL)

            let player: AVPlayer = AVPlayer(url: videoURL)
            let playerView: AVPlayerViewController = AVPlayerViewController()
            playerView.player = player
            playerView.view.frame = CGRect(x: 0, y: 0, width: cell.video.frame.width, height: cell.video.frame.height)
            cell.video.addSubview(playerView.view)
            player.play()
            return cell
        }
    }

    override func didUpdate(to object: Any) {
        feed = object as? Feed
    }

    override func didSelectItem(at _: Int) {
    }
}
