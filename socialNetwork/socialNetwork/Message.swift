//
//  Message.swift
//  socialNetwork
//
//  Created by asokol on 11/17/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import Foundation

struct Message: Codable {
    var user:String
    var text: String
    var date: Date
    var imgURL: String?
    var id: String?
    var replyTo: String?
    var likedBy: [String]
}
