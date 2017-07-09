//
//  PostsViewController.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

let EmbedCollectionViewControllerIdentifier = "EmbedCollectionViewController"
let ShowDetailsIdentifier = "ShowDetails"

class PostsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var collectionViewController: PostsCollectionViewController!
    
    var postModels: [PostModel]?
    
    var postViewModels: [PostCellViewModel]? {
        
        guard let models = postModels else {
            return nil
        }
        
        var postViewModels = [PostCellViewModel]()
        for post in models {
            postViewModels.append(PostCellViewModel.init(postModel: post))
        }
        
        return postViewModels
    }
    
    var postDetailViewModels: [PostDetailsViewModel]? {
        
        guard let models = postModels else {
            return nil
        }
        
        var postViewModels = [PostDetailsViewModel]()
        for post in models {
            postViewModels.append(PostDetailsViewModel.init(postModel: post))
        }
        
        return postViewModels
    }
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewController.postCellViewModels = postViewModels
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == EmbedCollectionViewControllerIdentifier {
            collectionViewController = segue.destination as! PostsCollectionViewController
            collectionViewController.delegate = self
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        collectionViewController.columnsNumber = sender.selectedSegmentIndex + 1
    }

}

extension PostsViewController: PostsCollectionViewControllerDelegate {
    func postCollection(controller: PostsCollectionViewController, didSelectPostAtIndex: Int) {

        let details = PostDetailsViewController()
        details.viewModels = postDetailViewModels
        details.galleryIndex = UInt(didSelectPostAtIndex)
        let navigation = UINavigationController(rootViewController: details)
        present(navigation, animated: true, completion: nil)
    }
}
