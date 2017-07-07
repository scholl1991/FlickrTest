//
//  NetworkManager.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class NetworkManager: NSObject {

    private var baseURLString: String
    
    init(baseURL: String) {
        self.baseURLString = baseURL
        
        super.init()
    }
    
    func getPhotos(text: String, completion: @escaping (_ response: Any?, _ error: Error?)->()) {
        
        let parameters = ["api_key" : "70c3f1cf4bba1aaa01ad2ee6c06e7bb3", "method" : "flickr.photos.search", "text" : text]
        
        Alamofire.request(baseURLString, parameters: parameters, encoding: URLEncoding.default).response { response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
            
            completion(response.data, response.error)
        }
    }
    
    func requestImage(path: String, completionHandler: @escaping (Image) -> Void){
        Alamofire.request("\(path)").responseImage(imageScale: 1.5, inflateResponseImage: false, completionHandler: {response in
            guard let image = response.result.value else{
                print(response.result)
                return
            }
            completionHandler(image)
        })
    }
    
}
