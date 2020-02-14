//
//  ExpandableTopMenuViewController.swift
//  ScrollViewConstraints
//
//  Created by Consultant on 2/14/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

// todo: consider orientation changes
// add table view and/or scroll view

class ExpandableTopMenuViewController: UIViewController {

    // top: begin at 30%
    // shrink to 10%
    // grow to 50%
    @IBOutlet weak var topMenuView: UIView!
    
    // bottom: be the part the user scrolls up & down with.
    @IBOutlet weak var scrollabelContentView: UIView! {
        didSet {
            scrollabelContentView.addGestureRecognizer(panGesture)
        }
    }
    
    // constraint whose constant we will reevaluate
    lazy var startingHeight: CGFloat = {
        return self.view.frame.height * 0.30
    }()
    lazy var topMenuHeightConstraint: NSLayoutConstraint = {
        let c = topMenuView.heightAnchor.constraint(equalToConstant: startingHeight)
        NSLayoutConstraint.activate([c])
        return c
    }()
    
    // some way to allow scrolling up and down, continuously
    lazy var panGesture: UIGestureRecognizer = {
        let p = UIPanGestureRecognizer(target: self, action: #selector(userDidScrollGesture(_:)))
        return p
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // build the constraint once
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let _ = topMenuHeightConstraint
    }
    
    
    // function to check the direction, amount scrolled
    // and adjust the height of the top menu
    @objc func userDidScrollGesture(_ sender: UIPanGestureRecognizer) {
        var y = sender.translation(in: self.view).y // new value
        print(y)
        y *= 1.2 // multipler, if you want it to scroll faster
        // find the new value
        y += topMenuHeightConstraint.constant
        // ensure it's in our range
        y = min(y, view.frame.height * 0.50)
        y = max(y, view.frame.height * 0.10)

        
        // assign that value
        topMenuHeightConstraint.constant = y
        sender.setTranslation(.zero, in: self.view) //normalize the scrolling
    }
    

}
/* -------NOTES-------
 //        // ensure it's in our range
 //        if y > self.view.frame.height * 0.50 {
 //            y = self.view.frame.height * 0.50
 //        }
 //        else if y < self.view.frame.height * 0.10 {
 //            y = self.view.frame.height * 0.10
 //        }

 
 */
