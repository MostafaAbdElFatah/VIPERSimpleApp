//  
//  PostsEntity.swift
//  VIPERSimpleAppCodeBased
//
//  Created by Mostafa Abd ElFatah on 10/9/20.
//  Copyright © 2020 MostafaAbdElFatah. All rights reserved.
//

import Foundation

struct User {
    let firstName:String
    let lastName:String
    let phone:String
    let address:String
}

struct PostDetails {
    let id:Int
    let post:String
    let date:Date
}


struct Post {
    let user:User
    let post:PostDetails
}

struct DisplayedPost {
    
    let name:String
    let post:String
    let date:String
    
    private var dateFormatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }()
    
    init(postInfo:Post) {
        self.name = "\(postInfo.user.firstName) \(postInfo.user.lastName)"
        self.post = postInfo.post.post
        self.date = self.dateFormatter.string(from: postInfo.post.date)
    }
    
}

enum PostsEntity{
    struct Request{}
    struct Response{
        var posts: [Post]
    }
    struct Display{
        var displayPosts: [DisplayedPost]
    }
}
