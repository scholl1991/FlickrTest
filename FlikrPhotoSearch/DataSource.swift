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
    
    fileprivate let networkManager = NetworkManager.init(baseURL: "http://flickr.com/services/rest/")
    
    
    func searchPosts(text: String, completion: @escaping (_ results: [PostModel]?, _ error: Error?)->()) {
        networkManager.getPhotos(text: text) { (response, error) in
            
            let xml = SWXMLHash.parse(response as! Data)
            print(xml)
            
            completion(self.postsFromXML(xml: xml), error)
        }
    }

}

extension DataSource {
    fileprivate func postsFromXML(xml: XMLIndexer) -> [PostModel]? {
        
//        if let postsXML = xml["photos"].element {
//            
//        }
        
        var photos = [PostModel]()
        
        for elem in xml["rsp"]["photos"]["photo"].all {
            let model = PostModel.init(postId: (elem.element?.attribute(by: "id")?.text)!, farm: elem.element?.attribute(by: "farm")?.text, server: elem.element?.attribute(by: "server")?.text, secret: elem.element?.attribute(by: "secret")?.text, owner: elem.element?.attribute(by: "owner")?.text, title: elem.element?.attribute(by: "title")?.text)
            photos.append(model)
        }
        
        return photos
    }
    
}
