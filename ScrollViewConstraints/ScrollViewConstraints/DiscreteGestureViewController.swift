//
//  DiscreteGestureViewController.swift
//  ScrollViewConstraints
//
//  Created by Consultant on 2/4/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

class DiscreteGestureViewController: UIViewController {
    
    // MARK: - Storyboard Outlets
    
    @IBOutlet weak var swipableView: UIView!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewHeightConstraint2: NSLayoutConstraint!
    
    
    // MARK: Discrete Swipe Gestures
    
    var swipeUpGesture: UISwipeGestureRecognizer!
    var swipeDownGesture: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make gesture
        swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeUp))
        // choose direction
        swipeUpGesture.direction = .up
        // add to view
        swipableView.addGestureRecognizer(swipeUpGesture)
        
        
        swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeDown))
        swipeDownGesture.direction = .down
        swipableView.addGestureRecognizer(swipeDownGesture)
        
        // view has to be user-interactive
        swipableView.isUserInteractionEnabled = true
    }
    
    @objc func didSwipeUp() {
        print("did swipe up")
        topViewHeightConstraint.isActive = false
        topViewHeightConstraint2.isActive = true
        swipableView.layoutIfNeeded()
    }
    
    @objc func didSwipeDown() {
        topViewHeightConstraint.isActive = true
        topViewHeightConstraint2.isActive = false
        swipableView.layoutIfNeeded()
    }
    
}
