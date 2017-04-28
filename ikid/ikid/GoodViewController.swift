//
//  GoodViewController.swift
//  ikid
//
//  Created by Saif Mustafa on 4/27/17.
//  Copyright © 2017 saifm. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {
    
    @IBOutlet weak var goodDisplay: UILabel!
    
    var joke1 : GoodJoke1!;
    var joke2 : GoodJoke2!;
    
    fileprivate func makeJoke1() {
        
        if(joke1 == nil) {
            
            joke1 = storyboard?.instantiateViewController(withIdentifier: "GoodJoke1") as! GoodJoke1;
            
        }
        
    }
    
    fileprivate func makeJoke2() {
        
        if(joke2 == nil) {
            
            joke2 = storyboard?.instantiateViewController(withIdentifier: "GoodJoke2") as! GoodJoke2;
            
        }
        
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        
        goodDisplay.text = "";
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
