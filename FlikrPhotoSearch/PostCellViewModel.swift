//
//  PostCellViewModel.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

class PostCellViewModel: NSObject {

    var smallImageURLString: String?
    var largeImageURLString: String?
    var text: String?
    
    init(postModel: PostModel) {
        self.text = postModel.title
        self.smallImageURLString = postModel.smallImageUrlString
        self.largeImageURLString = postModel.largeImageURLString
        super.init()
    }
}
