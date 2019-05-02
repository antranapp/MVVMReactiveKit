//
//  ImageListTableViewCell.swift
//  MVVMReactiveSwift
//
//  Created by An Tran on 30.04.19.
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

class ImageListTableViewCell: UITableViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func prepareForReuse() {
        previewImageView.image = nil
        titleLabel.text = nil
    }
}
