//
//  ViewController.swift
//  UIPanGestureRecognizer
//
//  Created by Manolescu Mihai Alexandru on 18/09/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBOutlet weak var myView: UIView!
    @IBOutlet var viewSupport: UIView!

    //this function hides the status bar upwards:
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(panGestR(_:)))
        self.myView.addGestureRecognizer(panGR)
        
        self.view.addSubview(viewSupport)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "VCtoBeUsed")
        self.addChildViewController(vc!)
        self.viewSupport.addSubview((vc?.view)!)
        vc?.view.frame = viewSupport.bounds
    }
    

    func panGestR(_ sender: UIPanGestureRecognizer)
    {
        
        
        self.view.bringSubview(toFront: myView)
        
        let translation = sender.translation(in: self.view)
        myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
        /*
        let translation = sender.translation(in: myView)
        
        myView.frame.origin = translation
        */
        
        
        print("\n\(sender)\n")
 
        if sender.state == UIGestureRecognizerState.ended
        {
           getBackToDefaultPlace()
        }
    }
    
    func getBackToDefaultPlace()
    {
        let desiredPosition = CGPoint(x: (view.center.x), y:(view.center.y))
        UIView.animate(withDuration: 0.2, animations: {self.myView.center = desiredPosition})
    }
    
}



