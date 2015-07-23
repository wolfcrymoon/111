//
//  TestViewController.swift
//  test
//
//  Created by 孫善群 on 2015/7/15.
//  Copyright (c) 2015年 孫善群. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    private lazy var imageView = UIImageView(image: UIImage(named: "MV.start"))
    private lazy var imageViewHistory = UIImageView(image: UIImage(named: "MV.history"))
    private(set) lazy var btn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    private(set) lazy var btn2 = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    
    
    override func loadView() {
        super.loadView()
        
//        view.addSubview(imageView)
        view.addSubview(imageViewHistory)
        view.addSubview(btn)
        view.addSubview(btn2)
        
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "btnAction", userInfo: nil, repeats: true)
        
        btn.setImage(UIImage(named: "MV.sos"), forState: UIControlState.Normal)
        btn.sizeToFit()
        btn.addTarget(self, action: "btnAction", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn2.setImage(UIImage(named: "MV.start"), forState: UIControlState.Normal)
        btn2.sizeToFit()
        btn2.addTarget(self, action: "btn2Action", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.OUFillBackgroundImage(named: "MV.background.p")
//        imageView.OUPlaceRelativeToSuperView(OUPlaceRelativeToSuperViewAnchor.Center, proportionX: 0.5, proportionY: 0.5)
        imageViewHistory.OUPlaceRelativeToSuperView(OUPlaceRelativeToSuperViewAnchor.Center, proportionX: 0.2, proportionY: 0.9)
        btn.OUPlaceRelativeToSuperView(OUPlaceRelativeToSuperViewAnchor.Center, proportionX: 0.1, proportionY: 0.1)
        btn2.OUPlaceRelativeToSuperView(OUPlaceRelativeToSuperViewAnchor.Center, proportionX: 0.4, proportionY: 0.1)

    }
    
    func btnAction() {
        imageViewHistory.hidden = !imageViewHistory.hidden
        if imageViewHistory.hidden {
            btn2.enabled = false
        } else {
            btn2.enabled = true
        }
    }
    
    func btn2Action() {
        btn.hidden = !btn.hidden
        if btn.hidden {
            imageViewHistory.hidden = !imageViewHistory.hidden
        } else {
            imageViewHistory.hidden = !imageViewHistory.hidden
        }
    }
    
    
}

