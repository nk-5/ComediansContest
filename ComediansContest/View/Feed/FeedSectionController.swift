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
    static var test: Bool = false
    
    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: (collectionContext?.containerSize.width)!, height: 400)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil") }
        if !FeedSectionController.test {
            FeedSectionController.test = true
            let cell:FeedImageCell = collectionContext?.dequeueReusableCell(withNibName: "FeedImageCell", bundle: nil, for: self, at: index) as! FeedImageCell
            cell.userName.text = feed.user.name
            cell.imageView.image = feed.image
            return cell
        } else {
            let cell:FeedMovieCell = collectionContext?.dequeueReusableCell(withNibName: "FeedMovieCell", bundle: nil, for: self, at: index) as! FeedMovieCell
            let asset: NSDataAsset = NSDataAsset.init(name: "movie")!
            let videoURL: URL = URL.init(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("gacky-movie.mov")
            try! asset.data.write(to: videoURL)
            
            let player: AVPlayer = AVPlayer.init(url: videoURL)
            let playerView:AVPlayerViewController = AVPlayerViewController.init()
            playerView.player = player
            playerView.view.frame = CGRect.init(x: 0, y: 0, width: cell.movie.frame.width, height: cell.movie.frame.height)
            cell.movie.addSubview(playerView.view)
            player.play()
            return cell
        }
    }
    
    override func didUpdate(to object: Any) {
        self.feed = object as? Feed
    }
    
    override func didSelectItem(at index: Int) {
    }
}
