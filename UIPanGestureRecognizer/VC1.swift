//
//  VC1.swift
//  UIPanGestureRecognizer
//
//  Created by Manolescu Mihai Alexandru on 21/09/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import UIKit

class VC1: UIViewController
{

    @IBOutlet weak var visualEffectBlur: UIVisualEffectView!
    
    @IBOutlet weak var eliteView: UIView!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        eliteView.layer.cornerRadius = eliteView.bounds.size.height/2
        
        UIView.animate(withDuration: 1, animations: {
            self.eliteView.transform = CGAffineTransform(scaleX: 10, y: 10)
        })
       
    }
    
    


    //this function hides the status bar upwards:
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
}
