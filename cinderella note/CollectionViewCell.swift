//
//  CollectionViewCell.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2021/05/27.
//  Copyright © 2021 豊田莉彩. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var graphView: UIView!
    
    var height: CGFloat = 0.5 {
        didSet {
            guard let graphView = graphView else { return }
            graphView.heightAnchor.constraint(equalToConstant: height * self.frame.height).isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("TestCollectionViewCell", owner: self, options: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
