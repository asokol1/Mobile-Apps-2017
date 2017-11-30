//
//  Networking.swift
//  socialNetwork
//
//  Created by asokol on 11/17/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import Foundation
import UIKit

//class holding User Actions
class Networking{
    
    //create Singleton
    static var sharedNetworking = Networking()
    
    var strURL = String("https://obscure-crag-65480.herokuapp.com")
    lazy var mainURL     = URL(string: strURL)
    lazy var loginURL    = URL(string: strURL + "/login")!
    lazy var usersURL    = URL(string: strURL + "/users")!
    lazy var messagesURL = URL(string: strURL + "/messages")!
    lazy var likeURL     = URL(string: strURL + "/like")!
    
    //get saved token from UserInformation
    lazy var getToken = UserInformation.sharedUserInformation.token()
    
    func login(user: User, completionHandler: @escaping (String?) -> ()){
        var request = URLRequest(url: loginURL)
        request.httpBody = try? JSONEncoder().encode(user)
        request.httpMethod = "POST"
        let tokenTask = URLSession(configuration: .ephemeral).dataTask(with: request) { (data, response, error) in
            let rToken = try! JSONDecoder().decode(Token.self, from: data!)
            UserInformation.sharedUserInformation.userInfo(username: user.name, token: rToken.token)
            completionHandler(rToken.token)
        }
        tokenTask.resume()
    }
    
    func getUsers(completionHandler: @escaping([String]) -> ()){
        var request = URLRequest(url: usersURL)
        request.httpMethod = "GET"
        request.addValue(getToken, forHTTPHeaderField: "token")
        let usersTask = URLSession(configuration: .ephemeral).dataTask(with: request) {(data,response,error) in
            let users = try! JSONDecoder().decode([String].self, from: data!)
            completionHandler(users)
        }
        usersTask.resume()
    }
    
    func makePost(message: Message, completionHandler: @escaping (Bool) ->()){
        var request = URLRequest(url: messagesURL)
        request.httpBody = try? JSONEncoder().encode(message)
        request.httpMethod = "POST"
        request.addValue(getToken, forHTTPHeaderField: "token")
        let makePostTask = URLSession(configuration: .ephemeral).dataTask(with: request){(data,response, error) in
            completionHandler(String(data: data!, encoding: .utf8) == "[\"success\"]")
        }
        makePostTask.resume()
    }
    
    func getPosts(completionHandler: @escaping ([Message]?) -> ()){
        var request = URLRequest(url: messagesURL)
        request.httpMethod = "GET"
        request.addValue(getToken, forHTTPHeaderField: "token")
        let getPostTask = URLSession(configuration: .ephemeral).dataTask(with: request){(data, response, error) in
            let posts = try? JSONDecoder().decode([Message].self, from: data!)
            completionHandler(posts)
        }
        getPostTask.resume()
    }
    
    func like(messageID: String, completionHandler: @escaping (Bool) -> ()){
        var request = URLRequest(url: likeURL)
        let liked = Like(likedMessageID: messageID)
        request.httpMethod = "POST"
        request.addValue(getToken, forHTTPHeaderField: "token")
        request.httpBody = try? JSONEncoder().encode(liked)
        let likeTask = URLSession(configuration: .ephemeral).dataTask(with: request){(data,response, error) in
            completionHandler(String(data:data!, encoding: .utf8) == "[\"success\"]")
        }
        likeTask.resume()
    }
    
}
