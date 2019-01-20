//
//  helpViewController.swift
//  wkwebview
//
//  Created by Luis F. Perrone on 1/19/19.
//  Copyright © 2019 Plaid LLC. All rights reserved.
//

import UIKit

class helpViewController: UIViewController {

    @IBOutlet weak var tutorialButton: UIButton!
    
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
    
    func prepareLayout(){
        
        tutorialButton.layer.cornerRadius = 8.0
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
