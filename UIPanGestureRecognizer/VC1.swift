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
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var descriptionText: UITextView!

    var infoState = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        eliteView.layer.cornerRadius = eliteView.bounds.size.height/2
        labelOne.alpha = 0
        
        /*
        let viewCircle = UIView()
        
        let screenSize: CGRect = infoButton.bounds
        viewCircle.frame = CGRect(x: 0, y: 0, width: 50, height: screenSize.size * 2)
        
        viewCircle.layer.borderColor = UIColor.black.cgColor
        viewCircle.layer.borderWidth = 3
        viewCircle.layer.cornerRadius = infoButton.layer.bounds.size.height/2
        
        infoButton.addSubview(viewCircle)
 */
    }
    
    
    
    @IBAction func infoButton(_ sender: Any)
    {
        if !infoState
         {
            infoState = true
            
            UIView.animate(withDuration: 1, animations:{
                self.eliteView.transform = CGAffineTransform(scaleX: 7, y: 7)
                
                UIView.animate(withDuration: 1, animations:{
                    self.infoButton.transform = CGAffineTransform(translationX: 1, y: -80)
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
