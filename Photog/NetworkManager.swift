//
//  NetworkManager.swift
//  Photog
//
//  Created by Adam Andrewjeski on 10/28/14.
//  Copyright (c) 2014 One Month iOS. All rights reserved.
//

import Foundation

typealias ObjectsCompletionHandler = (objects: [AnyObject]?, error: NSError?) -> ()

public class NetworkManager
{
    public class var sharedInstance: NetworkManager
    {
        struct Singleton
        {
            static let instance = NetworkManager()
        }
        
        return Singleton.instance
    }
    
    func follow(user: PFUser, completionHandler:(error: NSError?) -> ()) {
        var relation = PFUser.currentUser().relationForKey("following")
        relation.addObject(user)
        PFUser.currentUser().saveInBackgroundWithBlock({
            (success, error) -> Void in
            
            completionHandler(error: error)
            
        })
    }
    
    func fetchFeed(completionHandler: ObjectsCompletionHandler!) {
        var relation = PFUser.currentUser().relationForKey("following")
        var query = relation.query()
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if error != nil {
                println("error in following")
                completionHandler(objects: nil, error: error)
            }
            else {
                println("success in following \(objects)")
                
                var postQuery = PFQuery(className: "Post")
                postQuery.whereKey("User", containedIn: objects)
                postQuery.orderByDescending("createdAt")
                postQuery.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error:NSError!) -> Void in
                    if error != nil {
                        println("error fetching feed posts")
                        completionHandler(objects: nil, error: error)
                    }
                    else {
                        println("success fetching feed posts \(objects)")
                        completionHandler(objects: nil, error: nil)
                    }
                })
            }
            
        }
    }
    
}