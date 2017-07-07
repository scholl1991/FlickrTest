//
//  PostModel.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

class PostModel: NSObject {

    var postId: String!
    var farm: String?
    var server: String?
    var secret: String?
    var owner: String?
    var title: String?
    
    init(postId: String, farm: String?, server: String?, secret: String?, owner: String?, title: String?) {
        super.init()
        self.postId = postId
        self.farm = farm
        self.server = server
        self.secret = secret
        self.owner = owner
        self.title = title
    }
    
}
