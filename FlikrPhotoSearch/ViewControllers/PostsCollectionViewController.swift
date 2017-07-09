//
//  PostsCollectionViewController.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PostCell"
let InteritemSpacing: CGFloat = 5.0

protocol PostsCollectionViewControllerDelegate: class {
    func postCollection(controller: PostsCollectionViewController, didSelectPostAtIndex: Int) -> Void
}

class PostsCollectionViewController: UICollectionViewController {
    
    weak var delegate: PostsCollectionViewControllerDelegate?
    
    var columnsNumber = 1 {
        didSet {
            collectionView?.collectionViewLayout.invalidateLayout()
        }
    }
    
    var postCellViewModels: [PostCellViewModel]?

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postCellViewModels?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PostCell
        
        cell.viewModel = postCellViewModels?[indexPath.row]
    
        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.postCollection(controller: self, didSelectPostAtIndex: indexPath.row)
    }

}

extension PostsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let side = collectionView.bounds.size.width / CGFloat(columnsNumber) - InteritemSpacing * 2
        return CGSize.init(width: side, height: side)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return InteritemSpacing
    }
}
