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
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var goButton: UIButton!

    var infoState = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        eliteView.layer.cornerRadius = eliteView.bounds.size.height/2
        labelOne.alpha = 0
        
        goButton.layer.cornerRadius = goButton.bounds.size.height/2
    }
    
    
    
    @IBAction func infoButton(_ sender: Any)
    {
        if !infoState
         {
            infoState = true
            
            descriptionText.text = "    Tapp again on \"i\" to hide back the black screen. \n    This demonstration uses CGAffineTransform, UIView.animate and CALayer to make impressive graphic effects."
            
            UIView.animate(withDuration: 1, animations:{
                self.eliteView.transform = CGAffineTransform(scaleX: 7, y: 7)
                
                UIView.animate(withDuration: 1, animations:{
                    self.infoButton.transform = CGAffineTransform(translationX: 1, y: -130)
                })
                
                UIView.animate(withDuration: 2, animations:{
                    self.labelOne.alpha = 1
                })
            })
            
            UIView.animate(withDuration: 1.5, animations:{
                self.infoButton.setTitleColor(UIColor.white, for: .normal)
            })
         }
        else
         {
            infoState = false
            
            descriptionText.text = ""
            
            UIView.animate(withDuration: 1, animations:{
                self.eliteView.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                UIView.animate(withDuration: 1, animations:{
                    self.infoButton.transform = CGAffineTransform(translationX: 1, y: +2)
                })
                
                UIView.animate(withDuration: 1, animations:{
                    self.labelOne.alpha = 0
                })
            })
            
            UIView.animate(withDuration: 1.5, animations:{
                self.infoButton.setTitleColor(UIColor.black, for: .normal)
            })
         }
    }
    
    

    //this function hides the status bar upwards:
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
}
