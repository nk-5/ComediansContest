//
//  FeedCell.swift
//  ComediansContest
//

import UIKit

enum FunnyEvaluate: Int {
    case good
    case better
    case best
}

protocol FeedCellDelegate: class {
    func didTapFunny(cell: FeedCell, evaluate: FunnyEvaluate) -> Void
}

class FeedCell: UICollectionViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var good: UIButton!
    @IBOutlet weak var better: UIButton!
    @IBOutlet weak var best: UIButton!
    @IBOutlet weak var funnies: UILabel!
    @IBOutlet weak var comments: UIButton!
    @IBOutlet weak var share: UIButton!

    weak var delegate: FeedCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        good.addTarget(self, action: #selector(FeedCell.onGood(_:)), for: .touchUpInside)
        better.addTarget(self, action: #selector(FeedCell.onBetter(_:)), for: .touchUpInside)
        best.addTarget(self, action: #selector(FeedCell.onBest(_:)), for: .touchUpInside)
    }

    @objc func onGood(_: UIButton) {
        delegate?.didTapFunny(cell: self, evaluate: .good)
    }

    @objc func onBetter(_: UIButton) {
        delegate?.didTapFunny(cell: self, evaluate: .better)
    }
    
    @objc func onBest(_: UIButton) {
        delegate?.didTapFunny(cell: self, evaluate: .best)
    }
}
