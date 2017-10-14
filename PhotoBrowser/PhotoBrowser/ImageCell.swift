//
//  ImageCell.swift
//  PhotoBrowser
//
//  Created by asokol on 10/13/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell{
    var photo: Image?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(photo: Image){
        self.photo = photo
        ImageService.shared.imageForURL(url: photo.url) {(image, url) in
            if url == self.photo?.url{
                self.imageView.image = image
            }
        }
        
    }
    
}



