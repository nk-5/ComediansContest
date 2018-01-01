//
//  FeedSectionController.swift
//  ComediansContest
//
//

import UIKit
import IGListKit

class FeedSectionController: ListSectionController {

    var feed: Feed?
    
    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize.init(width: (collectionContext?.containerSize.width)!, height: 300)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil") }
        let cell = collectionContext?.dequeueReusableCell(withNibName: "FeedCell", bundle: nil, for: self, at: index) as! FeedCell
        cell.userName.text = feed.user.name
        cell.imageView.image = feed.image
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.feed = object as? Feed
    }
    
    override func didSelectItem(at index: Int) {
    }
}
