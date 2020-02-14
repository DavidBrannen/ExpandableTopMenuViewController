//
//  ViewController.swift
//  constrains
//
//  Created by MAC on 1/17/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    // up/down constraints
  //  @IBOutlet weak var topViewSmallerHeightPercent: NSLayoutConstraint!
    lazy var topViewHeightPercent: NSLayoutConstraint = {
        print("did make constraint")
        return self.topView.heightAnchor.constraint(equalToConstant: 300)
    }()
    lazy var topViewHeightReducred: NSLayoutConstraint = {
        return self.topView.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    var swipeUpGesture: UISwipeGestureRecognizer!
    var swipeDownGesture: UISwipeGestureRecognizer!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//right and left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
//up
        // make gesture
        swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeUp))
        // choose direction
        swipeUpGesture.direction = .up
        // add to view
        view.addGestureRecognizer(swipeUpGesture)
        
//down
        swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeDown))
        swipeDownGesture.direction = .down
        view.addGestureRecognizer(swipeDownGesture)
        
        // view has to be user-interactive
        view.isUserInteractionEnabled = true

        
    }

    @objc func didSwipeUp(swipe: UISwipeGestureRecognizer) {
        print("swiped up")
        topViewHeightReducred.isActive = false
        topViewHeightPercent.isActive = false
      //  topViewSmallerHeightPercent.isActive = true
        view.layoutIfNeeded()
    }
    @objc func didSwipeDown(swipe: UISwipeGestureRecognizer) {
        print("swiped down")
        topViewHeightReducred.isActive = false
        topViewHeightPercent.isActive = true
    //    topViewSmallerHeightPercent.isActive = false
        view.layoutIfNeeded()
    }
        
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        print("swiped right")
        topViewHeightPercent.isActive = false
        topViewHeightReducred.isActive = true
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func swipeLeftAction(swipe: UISwipeGestureRecognizer) {
        print("swiped left")
        topViewHeightReducred.isActive = false
        topViewHeightPercent.isActive = true
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }

}
