//
//  OperationResult.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 9/5/18.
//  Copyright © 2018 Sergii Shulga. All rights reserved.
//

import Foundation

typealias OperationCompletion<T> = (OperationResult<T>) -> Void

enum OperationResult<Value> {
    case success(Value)
    case failure(Error)
    
    init(error: Error?) {
        self = .failure(error ?? NSError(domain: "Undefined", code: 0, userInfo: [NSLocalizedDescriptionKey: "Undefined error."]))
    }
}
