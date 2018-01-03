//
//  FeedSectionController.swift
//  ComediansContest
//

import UIKit
import IGListKit
import AVKit

class FeedSectionController: ListSectionController, FeedCellDelegate {

    var feed: Feed?

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at _: Int) -> CGSize {
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 430)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil") }

        let cell: FeedCell = collectionContext?.dequeueReusableCell(withNibName: "FeedCell", bundle: nil, for: self, at: index) as! FeedCell
        cell.delegate = self
        cell.userName.text = feed.user.name
        cell.title.text = feed.content.title
        cell.funnies.text = feed.content.funnies
        let contentsRect: CGRect = CGRect(x: cell.contentsView.frame.origin.x,
                                          y: cell.contentsView.frame.origin.y - cell.userName.frame.origin.y,
                                          width: UIScreen.main.bounds.width,
                                          height: cell.contentsView.frame.height)

        cell.contentView.removeFromSuperview()

        switch feed.content.type {
        case .image:

            let imageView: UIImageView = UIImageView(frame: contentsRect)

            imageView.image = feed.content.image
            cell.addSubview(imageView)

        case .video:
            let asset: NSDataAsset = NSDataAsset(name: "movie")!
            let videoURL: URL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("gacky-movie.mov")
            try! asset.data.write(to: videoURL)

            let player: AVPlayer = AVPlayer(url: videoURL)
            let playerView: AVPlayerViewController = AVPlayerViewController()
            playerView.player = player
            playerView.view.frame = contentsRect
            viewController?.addChildViewController(playerView)
            cell.addSubview(playerView.view)
            playerView.didMove(toParentViewController: viewController)
        }

        return cell
    }

    override func didUpdate(to object: Any) {
        feed = object as? Feed
    }

    override func didSelectItem(at _: Int) {
    }

    // MARK: FeedCellDelegate
    func didTapFunny(cell _: FeedCell, evaluate: FunnyEvaluate) {
        print(evaluate)
    }
}
