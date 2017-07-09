//
//  PostDetailsViewController.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit
//import RMGallery

class PostDetailsViewController: RMGalleryViewController {

    var currentIndex = 0
    var viewModels: [PostDetailsViewModel]? {
        didSet {
            if isViewLoaded {
                galleryView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        galleryView.galleryDataSource = self
        galleryView.galleryDelegate = self
        
        title = viewModels?[Int(galleryIndex)].text
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDone))
    }
    
    func onDone(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension PostDetailsViewController: RMGalleryViewDataSource, RMGalleryViewDelegate {
    func galleryView(_ galleryView: RMGalleryView!, imageFor index: UInt, completion completionBlock: ((UIImage?) -> Swift.Void)!) {
        
        if let imageURLString = viewModels?[Int(index)].imageURLString {
            DataSource.shared.networkManager.requestImage(path: imageURLString) { (image, error) in
                print("loaded image for index: \(index) and url: \(imageURLString)")
                DispatchQueue.main.async {
                    completionBlock(image)
                }
            }
        }
    }
    
    func numberOfImages(in image: RMGalleryView!) -> UInt {
        if let count = viewModels?.count {
            return UInt(count)
        } else {
            return 0
        }
    }
    
    func galleryView(_ galleryView: RMGalleryView!, didChange index: UInt) {
//        currentIndex = Int(index)
        title = viewModels?[Int(index)].text
    }
}
