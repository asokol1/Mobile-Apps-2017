//
//  PostCells.swift
//  socialNetwork
//
//  Created by asokol on 11/17/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit
import SafariServices

class PostCells: UITableViewCell{
    
    var message: Message?
    var url: URL!
    var parentVC: UIViewController!
    var haveLiked: Bool = false
    var likes : Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var numLikes: UILabel!
    
    @IBOutlet weak var urlButton: UIButton!
    
    @IBAction func urlButtonTapped(_ sender: Any) {
        let safariVC = SFSafariViewController(url: self.url)
        parentVC.navigationController?.pushViewController(safariVC, animated: true)
    }
    
    @IBAction func likeButton(_ sender: Any) {
        if haveLiked == false{
            Networking.sharedNetworking.like(messageID: (message?.id)!){ (complete) in
                if complete{
                    DispatchQueue.main.async {
                        self.likes+=1
                        self.numLikes.text = self.likes.description
                    }
                }
            }
    }
    }
    
    override func prepareForReuse() {
        self.nameLabel.text = nil
        self.dateLabel.text = nil
        self.messageLabel.text = nil
        self.urlButton.setTitle(nil, for: .normal)
        
    }
    func configure(message: Message, parentVC: UIViewController){
        self.message = message
        let newName = message.user.split(separator: ".")
        var newString = ""
        for item in newName{
            newString = newString + item
            }
        self.textLabel?.text = newString
        let date: Date = (self.message?.date)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        self.dateLabel.text = dateFormatter.string(from: date)
        self.messageLabel.text = message.text
        self.likes = message.likedBy.count
        self.numLikes.text = self.likes.description
        self.parentVC = parentVC
        
        if message.imgURL != nil{
            self.urlButton.setTitle(message.imgURL, for: .normal)
            self.url = URL(string: message.imgURL!)!
        }else{
            self.urlButton.isHidden = true
            self.url = nil
            
        }
    }
}
