//
//  TabBarController.swift
//  Photog
//
//  Created by Adam Andrewjeski on 10/28/14.
//  Copyright (c) 2014 One Month iOS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var feedViewController = FeedViewController(nibName: "FeedViewController", bundle: nil)
        
        var profileViewController = UIViewController()
        profileViewController.view.backgroundColor = UIColor.yellowColor()
        
        var findPeopleViewController = UIViewController()
        findPeopleViewController.view.backgroundColor = UIColor.blackColor()
        
        var cameraViewController = UIViewController()
        cameraViewController.view.backgroundColor = UIColor.purpleColor()
        
        var viewControllers = [feedViewController, profileViewController, findPeopleViewController, cameraViewController]
        
        self.setViewControllers(viewControllers, animated: true)
        
        var imageNames = ["FeedIcon", "ProfileIcon", "SearchIcon", "CameraIcon"]
        
        let tabItems = tabBar.items as [UITabBarItem]
        for (index, value) in enumerate(tabItems) {
            var imageName = imageNames[index]
            value.image = UIImage(named: imageName)
            value.imageInsets = UIEdgeInsetsMake(5.0, 0, -5.0, 0)
        }
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationItem.hidesBackButton = true
        self.tabBar.translucent = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .Done, target: self, action: "didTapSignOut:")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Photog"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapSignOut(sender: AnyObject) {
        PFUser.logOut()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
