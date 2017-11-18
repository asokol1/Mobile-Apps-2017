//
//  UserInformation.swift
//  socialNetwork
//
//  Created by asokol on 11/17/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import Foundation

//store user Info for easy access in other files
class UserInformation {
    
    //create Singleton
    static var sharedUserInformation = UserInformation()
    
    func isTokenPresent() -> Bool{
        if (UserDefaults.standard.object(forKey: "token") != nil) {return true}
        else{return false}
    }
    
    func userInfo(username: String, token: String){
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(token, forKey: "token")
        UserDefaults.standard.synchronize()
    }
    
    func username() -> String{
        return UserDefaults.standard.string(forKey: "username")!
    }
    
    func token() -> String{
        return UserDefaults.standard.string(forKey: "token")!
    }
    
}
