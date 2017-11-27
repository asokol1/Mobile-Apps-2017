//
//  PostViewController.swift
//  socialNetwork
//
//  Created by asokol on 11/18/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class PostViewController: UIViewController{
    
    //Use TextViews instead of TextFields to allow for multiple lines w/o scaling
    @IBOutlet weak var postTextView: UITextView!
    let postPlaceholder = "Insert text here!"
    let urlPlaceholder = "Insert URL here!"
    @IBOutlet weak var urlTextView: UITextView!
    @IBAction func postButton(_ sender: Any) {
        sendPost()
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendPost(){
        var message: Message
        let messageText = self.postTextView.text ?? ""
        let user = UserInformation.sharedUserInformation.username()
        var img: String?
        //Check if url text is placeholder or user input
        if self.urlTextView.textColor == UIColor.lightGray{
            img = nil
        }else{
            img = self.urlTextView.text
        }
        message = Message(user: user, text: messageText, date: Date(), imgURL: img, id: nil, replyTo: nil, likedBy: [])
        Networking.sharedNetworking.makePost(message: message){ (complete) in
            if complete{
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        postTextView.text = postPlaceholder
        postTextView.textColor = UIColor.lightGray
        urlTextView.text = urlPlaceholder
        urlTextView.textColor = UIColor.lightGray
        postTextView.delegate = self
        urlTextView.delegate = self
    }
}

extension PostViewController: UITextViewDelegate{
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        sendPost()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    //Delete placeholder text on edit
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    //Replace
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            if textView.self == postTextView{
                textView.text = postPlaceholder
            }else if textView.self == urlTextView{
                textView.text = urlPlaceholder
            }
            
            textView.textColor = UIColor.lightGray
        }
    }
}
