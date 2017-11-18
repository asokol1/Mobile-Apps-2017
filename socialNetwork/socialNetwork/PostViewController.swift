//
//  PostViewController.swift
//  socialNetwork
//
//  Created by asokol on 11/18/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class PostViewController: UIViewController{
    
    @IBOutlet weak var postTextField: UITextField!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func postButton(_ sender: Any) {
        sendPost()
    }
    
    func sendPost(){
        var message: Message
        let messageText = self.postTextField.text ?? ""
        let user = UserInformation.sharedUserInformation.username()
        if let imageURL = self.urlTextField.text{
            var img: String?
            if imageURL == ""{
                img = nil
            }else{
                img = imageURL
            }
            message = Message(user: user, text: messageText, date: Date(), imgURL: img, id: nil, replyTo: nil, likedBy: [])
        }else{
            message = Message(user: user, text: messageText, date: Date(), imgURL: nil, id: nil, replyTo: nil, likedBy: [])
        }
        
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
        postTextField.delegate = self
        urlTextField.delegate = self
    }
    
    
}

extension PostViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendPost()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
