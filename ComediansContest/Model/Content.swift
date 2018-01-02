//
//  Content.swift
//  ComediansContest
//

import UIKit

enum ContentType: Int {
    case image
    case video
}

class Content {
    let id: String
    let type: ContentType
    let comment: String
    let image: UIImage
    let url: URL?
    let tags: Array<String>

    init(id: String, type: ContentType, comment: String, image: UIImage, url: String?, tags: Array<String>) {
        self.id = id
        self.type = type
        self.comment = comment
        self.image = image
        self.tags = tags
        guard let url = url else {
            self.url = nil
            return
        }
        self.url = URL(string: url)!
    }
}
