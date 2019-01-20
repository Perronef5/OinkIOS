//
//  SettingsViewController.swift
//  wkwebview
//
//  Created by Luis F. Perrone on 1/19/19.
//  Copyright © 2019 Plaid LLC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var piggyBankBalance: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var piggyBankLabel: UILabel!
    @IBOutlet weak var piggyBalance: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var bankBalanceLabel: UILabel!
    @IBOutlet weak var bankBalance: UILabel!
    @IBOutlet weak var dividerView: UIView!
    var piggyBalanceAmount = 0.0
    var availableBalance = 0.0
    var bankName = ""
    
    
    @IBAction func buttonAction(_ sender: Any) {
        switch ((sender as! UIButton).tag) {
        case 0:
            // Balance
            UIView.animate(withDuration: 1) {
                self.piggyBankLabel.alpha = 1
                self.piggyBalance.alpha = 1
                self.bankLabel.alpha = 1
                self.bankBalanceLabel.alpha = 1
                self.bankBalance.alpha = 1
                self.dividerView.alpha = 1
            }
            break
        case 1:
            // Logout
            break
        case 2:
            // Hammer Button Action
            let refreshAlert = UIAlertController(title: "Break your Piggy Bank", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Yes logic here")
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFade
                self.view.window!.layer.add(transition, forKey: kCATransition)
                let breakPiggyViewController = UIStoryboard.viewControllerMain(identifier: "BreakPiggyViewController") as! BreakPiggyViewController
                breakPiggyViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                self.present(breakPiggyViewController, animated: false, completion: nil)
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle No Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        // Do any additional setup after loading the view.
    }
    
    func prepareLayout() {
        piggyBankBalance.layer.cornerRadius = 10.0
        logoutButton.layer.cornerRadius = 8.0
        piggyBalance.text = "$\(piggyBalanceAmount)"
        bankLabel.text = bankName
        bankBalance.text = "$\(availableBalance)"
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
