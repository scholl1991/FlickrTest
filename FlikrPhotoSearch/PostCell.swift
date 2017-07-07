//
//  PostCell.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/7/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit
import AlamofireImage

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var viewModel: PostCellViewModel? {
        didSet {
            update()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update() {
        if let string = viewModel?.smallImageURLString,
            let url = URL(string: string) {
            imageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "ImagePlaceholder"))
        } else {
            imageView.image = UIImage(named: "ImagePlaceholder")
        }
    }
    
    override func prepareForReuse() {
        imageView.af_cancelImageRequest()
    }
    
}
