//
//  PostDetailsViewModel.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/7/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

class PostDetailsViewModel: NSObject {

    var imageURLString: String?
    var text: String?
    
    init(postModel: PostModel) {
        self.text = postModel.title
        self.imageURLString = postModel.largeImageURLString
        super.init()
    }
}
