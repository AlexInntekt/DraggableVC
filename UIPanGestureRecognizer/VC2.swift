//
//  VC2.swift
//  UIPanGestureRecognizer
//
//  Created by Manolescu Mihai Alexandru on 21/09/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import UIKit

class VC2: UIViewController
{
    
    //this function hides the status bar upwards:
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector( panGestureRecognizer(_:) ) )
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func panGestureRecognizer(_ gesture: UIPanGestureRecognizer)
    {
        //let translation = gesture.translation(in: view)
        //view.frame.origin = translation
        
        let translation = gesture.translation(in: self.view)
        
        var dragging = CGFloat()
           if translation.y >= 0
            {
              dragging = translation.y
            }
           else
            {
              dragging = 0
            }
        self.view.center = CGPoint(x: view.center.x, y: view.center.y + dragging)
        gesture.setTranslation(CGPoint.zero, in: self.view)
        
        
    if gesture.state == .ended
      {
        let velocity = gesture.velocity(in: self.view)
        print("\n #Velocity of gesture: ",velocity)
        
        if velocity.y >= 1500
        {
            self.dismiss(animated: true, completion: nil)
        }
        else{
                moveBack()
            }
      }
    }
    
    func moveBack()
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame.origin = CGPoint(x: 0, y: 0)
        })
    }
    
    
    
    
}
