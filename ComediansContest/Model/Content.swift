//
//  Content.swift
//  ComediansContest
//

import UIKit

enum ContentType: Int {
    case image
    case video
}

// TODO: delete tags
class Content {
    let id: String
    let type: ContentType
    let title: String
    let comment: String
    let image: UIImage
    let url: URL?
    let funnies: String
    let tags: Array<String>

    init(id: String,
         type: ContentType,
         title: String,
         comment: String,
         image: UIImage,
         url: String?,
         funnies: Int,
         tags: Array<String>) {

        self.id = id
        self.type = type
        self.title = title
        self.comment = comment
        self.image = image
        self.funnies = String(funnies)
        self.tags = tags
        guard let url = url else {
            self.url = nil
            return
        }
        self.url = URL(string: url)!
    }
}
