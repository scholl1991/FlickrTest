//
//  NetworkManager+Image.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 9/5/18.
//  Copyright © 2018 Sergii Shulga. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

extension NetworkManager {
    func requestImage(path: String, completionHandler: @escaping OperationCompletion<Image>){
        Alamofire.request("\(path)").responseImage(imageScale: 1.5, inflateResponseImage: false, completionHandler: {response in
            if let image = response.result.value {
                completionHandler(.success(image))
            } else{
                completionHandler(OperationResult(error: response.error))
            }
        })
    }
}
