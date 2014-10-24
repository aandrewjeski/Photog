//
//  UIViewController+Extensions.swift
//  Photog
//
//  Created by Adam Andrewjeski on 10/24/14.
//  Copyright (c) 2014 One Month iOS. All rights reserved.
//

import Foundation

extension UIViewController {
    func showAlert(message: String) {
        var alertController = UIAlertController(title: "Invalid E-mail", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}