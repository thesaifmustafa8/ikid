//
//  PunViewController.swift
//  ikid
//
//  Created by Saif Mustafa on 4/27/17.
//  Copyright © 2017 saifm. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {
    
    @IBOutlet weak var punDisplay: UILabel!
    
    var joke1 : PunJoke1!;
    var joke2 : PunJoke2!;
    
    fileprivate func makeJoke1() {
        
        if(joke1 == nil) {
            
            joke1 = storyboard?.instantiateViewController(withIdentifier: "PunJoke1") as! PunJoke1;
            
        }
        
    }
    
    fileprivate func makeJoke2() {
        
        if(joke2 == nil) {
            
            joke2 = storyboard?.instantiateViewController(withIdentifier: "PunJoke2") as! PunJoke2;
            
        }
        
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        punDisplay.text = "";
        makeJoke1();
        makeJoke2();
        
        UIView.beginAnimations("View Flip", context: nil);
        UIView.setAnimationDuration(0.5);
        UIView.setAnimationCurve(.easeInOut);
        
        if(joke1 != nil && joke1?.view.superview != nil) {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true);
            joke1.view.frame = view.frame;
            nextButtonController(joke1, to: joke2);
            
        } else {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true);
            joke1.view.frame = view.frame;
            nextButtonController(joke2, to: joke1);
            
        }
        
        UIView.commitAnimations();
        
    }
    
    fileprivate func nextButtonController(_ from: UIViewController?, to: UIViewController?) {
        
        if(from != nil) {
            
            from!.willMove(toParentViewController: nil);
            from!.view.removeFromSuperview();
            from!.removeFromParentViewController();
            
        }
        
        if(to != nil) {
            
            self.addChildViewController(to!);
            self.view.insertSubview(to!.view, at: 0);
            to!.didMove(toParentViewController: self);
            
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
