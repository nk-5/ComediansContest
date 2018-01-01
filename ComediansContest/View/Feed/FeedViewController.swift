//
//  FeedViewController.swift
//  ComediansContest
//

import UIKit
import IGListKit

class FeedViewController: UIViewController {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let user1: User = User.init(id: "user1", name: "keigo")
        let user2: User = User.init(id: "user2", name: "nk5")
        
        return [
            Feed(id: "test", user: user1, comment: "comment", image: UIImage.init(named: "gacky")!, tags: ["food", "movie"]),
            Feed(id: "hoge", user: user2, comment: "testtestt", image: UIImage.init(named: "gacky")!, tags: ["test", "sports"])
            ] as [ListDiffable]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return FeedSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
