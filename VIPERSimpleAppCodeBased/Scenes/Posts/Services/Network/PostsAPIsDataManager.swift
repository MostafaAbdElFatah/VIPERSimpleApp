//
//  PostsAPIsDataManager.swift
//  VIPERSimpleAppCodeBased
//
//  Created Mostafa Abd ElFatah on 10/9/20.
//

import Foundation

class PostsAPIsDataManager: PostsAPIsDataManagerInputProtocol {
    
    init() {}
    
    // Data fetch service methods goes here
    func fetchPosts(completionHandler: @escaping ([Post])  -> Void) {
        DispatchQueue.main.async {
            sleep(5)
            var posts:[Post] = []
            for num in 1..<5 {
                let user = User(firstName: "first\(num)", lastName: "last\(num)", phone: "phone\(num)", address: "address\(num)")
                let postDetails = PostDetails(id: num, post: "post\(num)", date: Date().dateByAdding(component: .day, value: num))
                let post = Post(user: user, post: postDetails)
                posts.append(post)
            }
            completionHandler(posts)
        }
        
    }
}


extension Date {
    
    func dateByAdding( component: Calendar.Component, value:Int) -> Date{
        let calendar = Calendar.current
        return calendar.date(byAdding: component, value: value, to: self) ?? self
    }
}
