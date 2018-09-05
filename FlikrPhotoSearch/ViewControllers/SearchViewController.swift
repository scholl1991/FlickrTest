//
//  ViewController.swift
//  FlikrPhotoSearch
//
//  Created by Sergii Shulga on 7/6/17.
//  Copyright © 2017 Sergii Shulga. All rights reserved.
//

import UIKit

let ShowPostsSegueIdentifier = "ShowPostsSegue"

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onSearch(_ sender: UIButton) {
        if let text = textField.text {
            DataSource.shared.searchPosts(text: text) { result in
                
                switch result {
                case .success(let models):
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: ShowPostsSegueIdentifier, sender: models)
                    }
                case .failure(let error):
                    let alert = UIAlertController(title: "Sorry", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                    DispatchQueue.main.async {
                        self.present(alert, animated: true)
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ShowPostsSegueIdentifier {
            guard let models = sender as? [PostModel],
                let dest = segue.destination as? PostsViewController else {
                return
            }
            
            dest.postModels = models
        }
    }

}

