//
//  Feed.swift
//  ComediansContest
//

import UIKit
import IGListKit

class Feed {
    let id: String
    let user: User
    let content: Content

    init(id: String, user: User, content: Content) {
        self.id = id
        self.user = user
        self.content = content
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
