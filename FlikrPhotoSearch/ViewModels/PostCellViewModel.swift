//
//  PostCellViewModel.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

class PostCellViewModel: NSObject {

    var imageURLString: String?
    
    init(postModel: PostModel) {
        self.imageURLString = postModel.smallImageUrlString
        super.init()
    }
}
