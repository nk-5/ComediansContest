//
//  FeedViewController.swift
//  ComediansContest
//

import UIKit
import IGListKit

class FeedViewController: UIViewController {

    lazy var adapter: ListAdapter = {
        ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension FeedViewController: ListAdapterDataSource {
    func objects(for _: ListAdapter) -> [ListDiffable] {
        let user1: User = User(id: "user1", name: "keigo")
        let user2: User = User(id: "user2", name: "nk5")
        let content1: Content = Content(id: "content1", type: .image, title: "静止画がっきー", comment: "comment", image: UIImage(named: "gacky")!, url: nil, tags: ["food", "movie"])
        let content2: Content = Content(id: "content2", type: .video, title: "動画がっきー", comment: "testtest", image: UIImage(named: "gacky")!, url: nil, tags: ["test", "sports"])

        return [
            Feed(id: "fuga", user: user1, content: content1),
            Feed(id: "hoge", user: user2, content: content2),
        ] as [ListDiffable]
    }

    func listAdapter(_: ListAdapter, sectionControllerFor _: Any) -> ListSectionController {
        return FeedSectionController()
    }

    func emptyView(for _: ListAdapter) -> UIView? {
        return nil
    }
}
