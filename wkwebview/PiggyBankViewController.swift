//
//  PiggyBankViewController.swift
//  wkwebview
//
//  Created by Luis F. Perrone on 1/18/19.
//  Copyright © 2019 Plaid LLC. All rights reserved.
//

import UIKit

class PiggyBankViewController: UIViewController {
    @IBOutlet weak var pigNoseButton: UIButton!
    @IBOutlet weak var leftEyeView: UIView!
    @IBOutlet weak var rightEyeView: UIView!
    @IBOutlet weak var leftNostrilView: UIView!
    @IBOutlet weak var rightNostrilView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var leftEyeTwinkle: UIView!
    @IBOutlet weak var rightEyeTwinkle: UIView!
    
    var availableBalance = 0.0
    var piggyBalance = 0.0
    var bankName = ""
    
    
    @IBAction func buttonAction(_ sender: Any) {
        
        switch ((sender as! UIButton).tag) {
        case 0:
            let vc = UIStoryboard.viewControllerMain(identifier: "DepositViewController") as! DepositViewController
            self.navigationController?.present(vc, animated: true)
            break
        case 1:
            let vc = UIStoryboard.viewControllerMain(identifier: "helpViewController") as! helpViewController
            self.navigationController?.present(vc, animated: true)
            break
        case 2:
            let vc = UIStoryboard.viewControllerMain(identifier: "SettingsViewController") as! SettingsViewController
            vc.availableBalance = availableBalance
            vc.bankName = bankName
            vc.piggyBalanceAmount = piggyBalance
            self.navigationController?.present(vc, animated: true)
            break
        default:
            break
        }
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        print("availableBalance: \(availableBalance)\n")
        print("bankName: \(bankName)")
        
        // Register to receive notification in your class
        NotificationCenter.default.addObserver(self, selector: #selector(self.breakPiggyBank(_:)), name: NSNotification.Name(rawValue: "breakPiggyBankNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.depositIntoPiggyBank(_:)), name: NSNotification.Name(rawValue: "depositNotification"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    func prepareLayout() {
        self.navigationController?.isNavigationBarHidden = true

        pigNoseButton.layer.cornerRadius = 100.0
        pigNoseButton.layer.masksToBounds = false
        pigNoseButton.layer.shadowColor = UIColor.black.cgColor
        pigNoseButton.layer.shadowRadius = 6
        pigNoseButton.layer.shadowOpacity = 0.30
        pigNoseButton.layer.shadowOffset = CGSize(width: -4, height: 8)
        
        leftEyeView.layer.cornerRadius = 40.0
        rightEyeView.layer.cornerRadius = 40.0
        leftNostrilView.layer.cornerRadius = 25.0
        rightNostrilView.layer.cornerRadius = 25.0
        rightEyeTwinkle.layer.cornerRadius = 15.0
        leftEyeTwinkle.layer.cornerRadius = 15.0


    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PiggyBankViewController {
    
    // handle notification
    func breakPiggyBank(_ notification: NSNotification) {
        // Clearing Piggy Bank
        availableBalance += piggyBalance
        piggyBalance = 0.0
    }
    
    func depositIntoPiggyBank(_ notification: NSNotification) {
        if let amount = notification.userInfo?["depositAmount"] as? Double {
            piggyBalance += amount
            availableBalance -= amount
        }
    }
    
    
}
