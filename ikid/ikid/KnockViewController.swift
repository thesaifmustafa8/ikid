//
//  KnockViewController.swift
//  ikid
//
//  Created by Saif Mustafa on 4/27/17.
//  Copyright © 2017 saifm. All rights reserved.
//

import UIKit

class KnockViewController: UIViewController {
    
    @IBOutlet weak var knockDisplay: UILabel!
    
    var joke1 : KnockScreen1!;
    var joke2 : KnockScreen2!;
    var joke3 : KnockScreen3!;
    var joke4 : KnockScreen4!;
    
    fileprivate func makeJoke1() {
        
        if(joke1 == nil) {
            
            joke1 = storyboard?.instantiateViewController(withIdentifier: "KnockScreen1") as! KnockScreen1;
            
        }
        
    }

    fileprivate func makeJoke2() {
        
        if(joke2 == nil) {
            
            joke2 = storyboard?.instantiateViewController(withIdentifier: "KnockScreen2") as! KnockScreen2;
            
        }
        
    }
    
    fileprivate func makeJoke3() {
        
        if(joke3 == nil) {
            
            joke3 = storyboard?.instantiateViewController(withIdentifier: "KnockScreen3") as! KnockScreen3;
            
        }
        
    }
    
    fileprivate func makeJoke4() {
        
        if(joke4 == nil) {
            
            joke4 = storyboard?.instantiateViewController(withIdentifier: "KnockScreen4") as! KnockScreen4;
            
        }
        
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        knockDisplay.text = "";
        makeJoke1();
        makeJoke2();
        makeJoke3();
        makeJoke4();
        
        UIView.beginAnimations("View Flip", context: nil);
        UIView.setAnimationDuration(0.5);
        UIView.setAnimationCurve(.easeInOut);
        
        if(joke1 != nil && joke1?.view.superview != nil) {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true);
            joke2.view.frame = view.frame;
            nextButtonController(joke1, to: joke2);
            
        } else if (joke2 != nil && joke2?.view.superview != nil) {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true);
            joke3.view.frame = view.frame;
            nextButtonController(joke2, to: joke3);
            
        } else if (joke3 != nil && joke3?.view.superview != nil) {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true);
            joke4.view.frame = view.frame;
            nextButtonController(joke3, to: joke4);
            
        } else {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true);
            joke1.view.frame = view.frame;
            nextButtonController(joke4, to: joke1);
            
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

