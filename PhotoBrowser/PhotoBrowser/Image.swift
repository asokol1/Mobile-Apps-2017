//
//  Image.swift
//  PhotoBrowser
//
//  Created by asokol on 10/12/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import Foundation

struct Image{
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int
    let url: URL?
    
    init(id: String, owner: String, secret:String, server:String, farm:Int, title:String, ispublic:Int, isfriend:Int, isfamily:Int, url:URL){
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
        //url should look like: https://farm5.static.flickr.com/4372/36669014643_ebea126ea3.jpg
        self.url = URL(string: "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg")
        
    }
    
    init(dictionary: [String: Any]){
        let id = dictionary["id"] as! String
        let owner = dictionary["owner"] as! String
        let secret = dictionary["secret"] as! String
        let server = dictionary["server"] as! String
        let farm = dictionary["farm"] as! Int
        let title = dictionary["title"] as! String
        let ispublic = dictionary["ispublic"] as! Int
        let isfriend = dictionary["isfriend"] as! Int
        let isfamily = dictionary["isfamily"] as! Int
        let url = URL(string: "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg")
        self.init(id: id, owner: owner, secret: secret, server: server, farm: farm, title: title, ispublic: ispublic, isfriend: isfriend, isfamily: isfamily, url :url!)
    }
}

