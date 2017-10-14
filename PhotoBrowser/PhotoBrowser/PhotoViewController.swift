//
//  PhotoViewController.swift
//  PhotoBrowser
//
//  Created by asokol on 10/13/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController{
    var image: Image?
    
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = image?.title
        ImageService.shared.imageForURL(url: image?.url) {(image, url) in
            self.imageView.image = image
        }
    }
}
