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
    
    override func viewDidLoad() {
        super .viewDidLoad()
        postCellTableView.dataSource = self
        getPosts()
        print("loaded mainVC")
        
        
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

