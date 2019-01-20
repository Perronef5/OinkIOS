//
//  RequestCompleteViewController.swift
//  SeroundIOS
//
//  Created by Luis Perrone on 10/27/17.
//  Copyright © 2017 Seround. All rights reserved.
//

import UIKit
import Lottie

class BreakPiggyViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var lottieBGView: UIView!
    private var checkMarkAnimation: LOTAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        
        //        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        //        DispatchQueue.main.asyncAfter(deadline: when) {
        //            self.backTwo()
        //        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkMarkAnimation = LOTAnimationView(name: "wallet_&_coin")
        checkMarkAnimation!.contentMode = .scaleAspectFill
        checkMarkAnimation!.frame = lottieBGView.bounds
        // Add the Animation
        lottieBGView.addSubview(checkMarkAnimation!)
        //        lottieBGView.sendSubview(toBack: boatAnimation!)
        checkMarkAnimation?.play{ (finished) in
            //self.playSuccessfulSound()
            self.animateLabels()
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.backTwo()
            }
            // Do Something
        }
        
        //        animationView.play(fromProgress: 0.25, toProgress: 0.5, withCompletion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepare() {
        
        self.navigationController?.isNavigationBarHidden = true
        self.titleLabel.alpha = 0.0
        self.subTitleLabel.alpha = 0.0
        //        if (self.isBeingPresented && (self.navigationController != nil)) {
        //        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        //            self.view.insertSubview(viewControllers[viewControllers.count - 2].view, belowSubview: (self.view)!)
        //        }
        
        
        /* Customize Background of View Controller */
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        //        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        //        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //        blurEffectView.frame = self.view.bounds
        //        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        blurEffectView.clipsToBounds = true
        //        self.view.addSubview(blurEffectView)
        //        self.view.sendSubview(toBack: blurEffectView)
        //
        
        backgroundView.layer.cornerRadius = 6
        backgroundView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundView.layer.shadowOpacity = 0.3
        backgroundView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        
        
    }
    
    func backTwo() {
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "breakPiggyBankNotification"), object: nil, userInfo: nil)
        // `default` is now a property, not a method call
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFade
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        
    }
    
    func animateLabels() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            self.titleLabel.alpha = 1.0
            self.subTitleLabel.alpha = 1.0
        }) { (success: Bool) in
            print("Done moving label")
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
