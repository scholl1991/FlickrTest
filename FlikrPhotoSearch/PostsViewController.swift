//
//  PostsViewController.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

let EmbedCollectionViewControllerIdentifier = "EmbedCollectionViewController"

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewController.postCellViewModels = postViewModels
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == EmbedCollectionViewControllerIdentifier {
            self.collectionViewController = segue.destination as! PostsCollectionViewController
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        collectionViewController.columnsNumber = sender.selectedSegmentIndex + 1
    }

}
