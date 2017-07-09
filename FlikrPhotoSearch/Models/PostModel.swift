//
//  PostModel.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

enum ImageSize {
    case small
    case large
}

class PostModel: NSObject {

    var postId: String!
    var farm: String?
    var server: String?
    var secret: String?
    var owner: String?
    var title: String?
    
    var smallImageUrlString: String? {
        return createImageURLString(size: .small)
    }
    
    var largeImageURLString: String? {
        return createImageURLString(size: .large)
    }
    
    init(postId: String, farm: String? = nil, server: String? = nil, secret: String? = nil, owner: String? = nil, title: String? = nil) {
        super.init()
        self.postId = postId
        self.farm = farm
        self.server = server
        self.secret = secret
        self.owner = owner
        self.title = title
    }
    
    fileprivate func createImageURLString(size: ImageSize) -> String? {
        guard let uFarm = farm, let uServer = server, let uPostId = postId, let uSecret = secret else {
            return nil
        }
        
        var sizeString = "z"
        switch size {
        case .small:
            sizeString = "z"
        case .large:
            sizeString = "z"
        }
        
        return "https://farm\(uFarm).staticflickr.com/\(uServer)/\(uPostId)_\(uSecret)_\(sizeString).jpg"
    }
}
