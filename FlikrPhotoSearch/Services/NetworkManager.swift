//
//  NetworkManager.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {

    private var baseURLString: String
    
    init(baseURL: String) {
        self.baseURLString = baseURL
        
        super.init()
    }
    
    func getPhotos(text: String, completion: @escaping (_ response: Any?, _ error: Error?)->()) {
        
        let parameters = [APIKey : "70c3f1cf4bba1aaa01ad2ee6c06e7bb3", MethodKey : "flickr.photos.search", TextKey : text]
        
        Alamofire.request(baseURLString, parameters: parameters, encoding: URLEncoding.default).response { response in
            
            // Netowrk layer errors should be handled here
            
            completion(response.data, response.error)
        }
    }
}
