//
//  ViewController.swift
//  wkwebview
//
//  Copyright (c) 2016 Plaid Inc. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var noseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
    }
    
    func prepareLayout() {
        noseButton.layer.cornerRadius = 6.0
        noseButton.layer.masksToBounds = false
        noseButton.layer.shadowColor = UIColor.black.cgColor
        noseButton.layer.shadowRadius = 4
        noseButton.layer.shadowOpacity = 0.30
        noseButton.layer.shadowOffset = CGSize(width: -2, height: 4)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

