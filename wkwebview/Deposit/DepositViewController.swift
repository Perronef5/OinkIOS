//
//  RequestViewController.swift
//  SeroundIOS
//
//  Created by Luis Perrone on 8/25/17.
//  Copyright © 2017 Seround. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var slidesView: UIScrollView!
    @IBOutlet weak var pageControlView: UIPageControl!
    var currentPage = 0
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    var priceLabel: UILabel!
    var confirmPriceLabel: UILabel!
    var depositComplete = false
    
    @IBAction func backAction(_ sender: Any) {
        if currentPage == 0 {
            if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            slidesView.setContentOffset(CGPoint(x: 0, y: slidesView.contentOffset.y), animated: true)
            pageControlView.currentPage = currentPage
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepare() {
        
        slidesView.delegate = self
        let slides:[DepositSlidesView] = creatSlides()
        setUpSlideScrollView(slides)
        
        self.navigationController?.isNavigationBarHidden = true
        
        //        let outerView3 = UIView()
        //        outerView3.frame = backButtonView.frame
        //        outerView3.clipsToBounds = false
        //        outerView3.layer.shadowColor = self.UIColorFromRGB(rgbValue: 0x31597F).cgColor
        //        outerView3.layer.shadowOpacity = 0.3
        //        outerView3.layer.shadowOffset = CGSize.zero
        //        outerView3.layer.shadowRadius = 4
        //        outerView3.layer.shadowPath = UIBezierPath(roundedRect: backButtonView.layer.bounds, cornerRadius: backButtonView.layer.width/2).cgPath
        //
        //        self.view.addSubview(outerView3)
        self.view.addSubview(backButtonView)
        self.view.addSubview(backButtonImage)
        backButtonView.layer.cornerRadius = backButtonView.frame.width/2
        backButtonView.clipsToBounds = true
        //        backButtonImage.image = backButtonImage.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        //        backButtonView.layer.borderWidth = 1.0
        //        backButtonView.borderColor = self.UIColorFromRGB(rgbValue: 0xe0e0e0)
        
        //        backButtonImage.tintColor = self.UIColorFromRGB(rgbValue: 0x545454)
        self.view.addSubview(button)
        
        
        
    }
    
    
    
    
    func creatSlides() -> [DepositSlidesView] {
        
        let slide1:DepositSlidesView = Bundle.main.loadNibNamed("DepositSlide", owner: self, options: nil)!.first as! DepositSlidesView
        priceLabel = slide1.priceLabel
        slide1.numberZeroButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberOneButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberTwoButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberThreeButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberOneButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberFourButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberfiveButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberSixButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberSevenButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberEightButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.numberNineButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.deleteButton.addTarget(self, action: #selector(self.numberPadAction(_:)), for: .touchUpInside)
        slide1.continueButton.addTarget(self, action: #selector(self.continueAction(_:)), for: .touchUpInside)
        slide1.continueButton.layer.cornerRadius = 6
        slide1.continueButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        slide1.continueButton.layer.shadowOpacity = 0.3
        slide1.continueButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        slide1.continueButton.layer.shadowRadius = 3.0
        
        
        let slide2:DepositSlidesView = Bundle.main.loadNibNamed("ConfirmSlide", owner: self, options: nil)!.first as! DepositSlidesView
        slide2.depositButton.addTarget(self, action: #selector(self.depositAction(_:)), for: .touchUpInside)
        slide2.depositButton.layer.cornerRadius = 6
        slide2.depositButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        slide2.depositButton.layer.shadowOpacity = 0.3
        slide2.depositButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        slide2.depositButton.layer.shadowRadius = 3.0
        confirmPriceLabel = slide2.confirmPriceLabel
        
        return[slide1,slide2]
        
    }
    
    func setUpSlideScrollView(_ slides: [DepositSlidesView]) {
        slidesView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - pageControlView.frame.height)
        slidesView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: slidesView.frame.height)
        slidesView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: slidesView.frame.height)
            slidesView.addSubview(slides[i])
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControlView.currentPage = Int(pageIndex)
        self.currentPage = Int(pageIndex)
    }
    
    override func willMove(toParentViewController parent: UIViewController?)
    {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension DepositViewController {
    
    @objc func depositAction(_ sender: Any) {
        let amount = Double(confirmPriceLabel.text!)
        let depositDataDict:[String: Double] = ["depositAmount": amount!]
        
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "depositNotification"), object: nil, userInfo: depositDataDict)
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFade
        self.view.window!.layer.add(transition, forKey: kCATransition)
        let depositCompleteViewController = UIStoryboard.viewControllerMain(identifier: "DepositCompleteViewController") as! DepositCompleteViewController
        depositCompleteViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        depositComplete = true
        self.present(depositCompleteViewController, animated: false, completion: nil)
    }
    
    @objc func continueAction(_ sender: Any) {
        slidesView.setContentOffset(CGPoint(x: self.view.frame.width, y: slidesView.contentOffset.y), animated: true)
        currentPage = 1
        confirmPriceLabel.text = priceLabel.text
        
        pageControlView.currentPage = currentPage
    }
    
    @objc func numberPadAction(_ sender: Any) {
        
        switch (sender as! UIButton).tag {
            
        case 0:
            if priceLabel.text == "0" {
                priceLabel.text = "0"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "0"
            }
            break
        case 1:
            if priceLabel.text == "0" {
                priceLabel.text = "1"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "1"
            }
            break
        case 2:
            if priceLabel.text == "0" {
                priceLabel.text = "2"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "2"
            }
            break
        case 3:
            if priceLabel.text == "0" {
                priceLabel.text = "3"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "3"
            }
            break
        case 4:
            if priceLabel.text == "0" {
                priceLabel.text = "4"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "4"
            }
            break
        case 5:
            if priceLabel.text == "0" {
                priceLabel.text = "5"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "5"
            }
            break
        case 6:
            if priceLabel.text == "0" {
                priceLabel.text = "6"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "6"
            }
            break
        case 7:
            if priceLabel.text == "0" {
                priceLabel.text = "7"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "7"
            }
            break
        case 8:
            if priceLabel.text == "0" {
                priceLabel.text = "8"
            } else if (priceLabel.text?.count)! < 3  {
                priceLabel.text = priceLabel.text! + "8"
            }
            break
        case 9:
            if priceLabel.text == "0" {
                priceLabel.text = "9"
            } else if (priceLabel.text?.count)! < 3 {
                priceLabel.text = priceLabel.text! + "9"
            }
            break
        case 10:
            if (priceLabel.text?.count)! < 2 {
                priceLabel.text = "0"
            } else {
                priceLabel.text!.remove(at: priceLabel.text!.index(before: priceLabel.text!.endIndex))
            }
            break
        default:
            break
            
        }
    }
    
    
}



