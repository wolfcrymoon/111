//
//  UIViewExtension.swift
//  KeyOUcare
//
//  Created by CYWang on 2015/1/21.
//  Copyright (c) 2015年 OUcare. All rights reserved.
//

import UIKit

/**
Anchor point relative to super view.

* Center: self.center
* FrameOrigin: self.frame.origin
*/
enum OUPlaceRelativeToSuperViewAnchor {
    case Center
    case FrameOrigin
}

extension UIView {
    /**
    Place view relative to superview proportionally.
    
    :param: anchor
    :param: proportionX
    proportion in X axis
    :param: proportionY
    proportion in Y axis
    */
    func OUPlaceRelativeToSuperView(anchor: OUPlaceRelativeToSuperViewAnchor,
        proportionX: CGFloat, proportionY: CGFloat) {
            if let sView = self.superview {
                var aPoint = CGPoint(x: sView.bounds.width * proportionX,
                    y: sView.bounds.height * proportionY)
                
                switch anchor {
                case .Center:
                    self.center = aPoint
                case .FrameOrigin:
                    self.frame.origin = aPoint
                }
            }
    }
    
    /**
    Fill background with image.
    
    :param: named
    pass to UIImage(named:)
    
    :returns: Loading image successfully or not
    */
    func OUFillBackgroundImage(#named: String) -> Bool {
        if var bkImg = UIImage(named: named) {
            UIGraphicsBeginImageContext(self.bounds.size)
            bkImg.drawInRect(self.bounds)
            bkImg = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.backgroundColor = UIColor(patternImage: bkImg)
            
            return true
        } else {
            return false
        }
    }
    /**
    Resizes and moves the receiver view so it just encloses its subviews.
    */
    func OUSizeToFit() {
        var rect = CGRectZero
        // union size
        for subview in subviews {
            rect = CGRectUnion(rect, subview.frame)
        }
        // move subviews
        for subview in subviews {
            (subview as! UIView).frame =
                CGRectOffset(subview.frame, -rect.origin.x, -rect.origin.y)
        }
        
        self.frame = CGRectOffset(rect, self.frame.origin.x, self.frame.origin.y)
    }
}
