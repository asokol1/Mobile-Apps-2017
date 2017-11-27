//
//  ViewController.swift
//  socialNetwork
//
//  Created by asokol on 11/9/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    static var posts: [Message] = []
    @IBOutlet weak var postCellTableView: UITableView!
    
    @IBAction func postButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        self.present(postVC, animated: true, completion: nil)
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        getPosts()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostCells
        let post = MainViewController.posts[indexPath.row]
        cell.messageLabel.text = post.text
        return cell
    }
    override func viewDidLoad() {
        super .viewDidLoad()
        postCellTableView.dataSource = self
        getPosts()
        self.postCellTableView.rowHeight = UITableViewAutomaticDimension
        self.postCellTableView.estimatedRowHeight = 50
    }
    
    func getPosts(){
        Networking.sharedNetworking.getPosts(){ (posts) in
            DispatchQueue.main.async {
                if let messages = posts{
                    MainViewController.posts = messages.reversed()
                    self.postCellTableView.reloadData()
                }
            }
        }
    }
}

extension MainViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewController.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.item)
        let post = MainViewController.posts[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCells", for: indexPath) as! PostCells
        cell.configure(message: post, parentVC: self)
        return cell
        
    }
}

