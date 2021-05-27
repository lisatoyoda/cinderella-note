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
    
    var width: CGFloat = 0.5 {
        didSet {
            guard let graphView = graphView else { return }
            graphView.widthAnchor.constraint(equalToConstant: width * self.frame.width).isActive = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
