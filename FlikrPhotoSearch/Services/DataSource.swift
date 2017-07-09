//
//  DataSource.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit
import SWXMLHash

class DataSource: NSObject {
    
    static let shared = DataSource()
    
    let networkManager = NetworkManager.init(baseURL: BaseURL)
    
    
    func searchPosts(text: String, completion: @escaping (_ results: [PostModel]?, _ error: Error?)->()) {
        networkManager.getPhotos(text: text) { (response, error) in
            
            let xml = SWXMLHash.parse(response as! Data)
            completion(self.postsFromXML(xml: xml), error)
        }
    }

}

extension DataSource {
    fileprivate func postsFromXML(xml: XMLIndexer) -> [PostModel]? {
        
        var photos = [PostModel]()
        
        // Here should be exeption throw if any problems with data parsing
        
        for elem in xml[RSPKey][PhotosKey][PhotoKey].all {
            let model = PostModel.init(postId: (elem.element?.attribute(by: PhotoIDKey)?.text)!,
                                       farm: elem.element?.attribute(by: FarmKey)?.text,
                                       server: elem.element?.attribute(by: ServerKey)?.text,
                                       secret: elem.element?.attribute(by: SecretKey)?.text,
                                       owner: elem.element?.attribute(by: OwnerKey)?.text,
                                       title: elem.element?.attribute(by: TitleKey)?.text)
            photos.append(model)
        }
        
        return photos
    }
    
}
