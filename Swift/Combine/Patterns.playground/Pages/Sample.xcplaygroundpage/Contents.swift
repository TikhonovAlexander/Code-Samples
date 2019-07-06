




//: [Previous](@previous)

import UIKit
import Combine

extension Notification.Name {
    static let newBlogPost = Notification.Name("new_blog_post")
}

struct BlogPost {
    let title: String
}

let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
    .map { (notification) -> String? in
        return (notification.object as? BlogPost)?.title ?? ""
}

let lastPostLabel = UILabel()
let lastPostLabelSubscriber = Subscribers.Assign(object: lastPostLabel, keyPath: \.text)
blogPostPublisher.subscribe(lastPostLabelSubscriber)

let blogPost = BlogPost(title: "Getting started with the Combine framework")
NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
print("Last post is: \(lastPostLabel.text!)")

//: [Next](@next)
