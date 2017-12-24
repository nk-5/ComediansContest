//
//  Feed.swift
//  ComediansContest
//

import UIKit
import IGListKit

class Feed {
    let id: String
    let user: User
    let comment: String
    let image: UIImage
    let tags: Array<String>
    
    init(id: String, user: User, comment: String, image: UIImage, tags: Array<String>) {
        self.id = id
        self.user = user
        self.comment = comment
        self.image = image
        self.tags = tags
    }
}

extension Feed: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let feed = object as? Feed {
            return id == feed.id
        }
        return false
    }
}
