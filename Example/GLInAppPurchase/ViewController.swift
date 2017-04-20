//
//  ViewController.swift
//  GLInAppPurchase
//
//  Created by gokulgovind on 04/12/2017.
//  Copyright (c) 2017 gokulgovind. All rights reserved.
//

import UIKit
import GLInAppPurchase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Check(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select Style", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Demo1", style: .default, handler: { (action) in
            self.demo1()
        }))
        actionSheet.addAction(UIAlertAction(title: "Demo2", style: .default, handler: { (action) in
            self.demo2()
        }))
        actionSheet.addAction(UIAlertAction(title: "Demo3", style: .default, handler: { (action) in
            self.demo3()
        }))
        actionSheet.addAction(UIAlertAction(title: "Demo4", style: .default, handler: { (action) in
            self.demo4()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.navigationController?.present(actionSheet, animated: true, completion: nil)
        
        
    }
    
    func showSimpleAlert(_ message:String) {
        DispatchQueue.main.async { 
            let alert = UIAlertController(title: "Completion Handler", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
       
    }
    
    func demo1() {
        let appBanner = GLInAppPurchaseUI(title: "Skip The Line", subTitle: "Be first in the queue", bannerBackGroundStyle: .transparentStyle)
        
        appBanner.displayContent(imageSetWithDescription:
            [
                UIImage(named:"IMG_1")!:"Rewind Your Last Swipe##Go back and swipe again",
                UIImage(named:"IMG_2")!:"",
                UIImage(named:"IMG_3")!:"Send More Super Likes##Let them know you are interested",
            ])
        appBanner.addButtonWith("BOOST ME", cancelTitle: "NO, THANKS") { (selectedTitle, isOptionSelected, selectedAction) in
            if isOptionSelected {  //Some Option have been selected
                print("Selected Price \(selectedAction.actionPrice!)")
            }
            if selectedTitle == "NO, THANKS" { //selectedButtonTitle
            }
            appBanner.dismissBanner()
            self.showSimpleAlert("\(selectedTitle) Button Clicked")
        }
        
        appBanner.addAction(GLInAppAction(title: "10", subTitle: "Boosts", price: "₹155.00/ea", handler: { (actin) in
            print("Completion handler called \(actin.actionSubTitle!) For \(actin.actionPrice!)")
        }))
        
        appBanner.addAction(GLInAppAction(title: "5", subTitle: "Boosts", price: "₹184.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle!) For \(action.actionPrice!)")
        }))
        
        appBanner.addAction(GLInAppAction(title: "1", subTitle: "Boosts", price: "₹250.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle!) For \(action.actionPrice!)")
        }))
        
        appBanner.presentBanner()
    }
    
    func demo2() {
        let appBanner = GLInAppPurchaseUI(title: "Skip The Line", subTitle: "Be first in the queue", bannerBackGroundStyle: .transparentStyle)
        
        appBanner.displayContent(imageSetWithDescription:
            [
                UIImage(named:"IMG_1")!:"Rewind Your Last Swipe##Go back and swipe again",
                UIImage(named:"IMG_2")!:"",
                UIImage(named:"IMG_3")!:"Send More Super Likes##Let them know you are interested",
            ])
        appBanner.addButtonWith("BOOST ME", cancelTitle: "NO, THANKS") { (selectedTitle, isOptionSelected, selectedAction) in
            if isOptionSelected {  //Some Option have been selected
                print("Selected Price \(selectedAction.actionPrice!)")
            }
            if selectedTitle == "NO, THANKS" { //selectedButtonTitle
            }
            appBanner.dismissBanner()
             self.showSimpleAlert("\(selectedTitle) Button Clicked")
        }
        
        
        appBanner.setBannerTheme([UIColor.white], headerTextColor: UIColor.black)
        appBanner.setButtomTheme([UIColor.blue,UIColor(netHex:0x2375F8)], buttonTextColor: UIColor.white)
        
        
        appBanner.presentBanner()
    }
    
    func demo3() {
        let appBanner = GLInAppPurchaseUI(title: "Skip The Line", subTitle: "Be first in the queue", bannerBackGroundStyle: .transparentStyle)
        
        
        appBanner.addButtonWith("BOOST ME", cancelTitle: "NO, THANKS") { (selectedTitle, isOptionSelected, selectedAction) in
            if selectedTitle == "NO, THANKS" { //selectedButtonTitle
            }
            appBanner.dismissBanner()
            self.showSimpleAlert("\(selectedTitle) Button Clicked")
        }
        
        
        appBanner.setBannerTheme([UIColor.white], headerTextColor: UIColor.black)
        appBanner.setButtomTheme([UIColor.blue,UIColor(netHex:0x2375F8)], buttonTextColor: UIColor.white)
        
        appBanner.presentBanner()
    }
    
    func demo4() {
        let appBanner = GLInAppPurchaseUI(title: "Demo 4", subTitle: "Be first in the queue", bannerBackGroundStyle: .transparentStyle)
        
        appBanner.displayContent(imageSetWithDescription:
            [
                UIImage(named:"IMG_1")!:"Rewind Your Last Swipe##Go back and swipe again",
                UIImage(named:"IMG_2")!:"",
                UIImage(named:"IMG_3")!:"Send More Super Likes##Let them know you are interested",
            ])
        appBanner.addButtonWith("BOOST ME", cancelTitle: "NO, THANKS") { (selectedTitle, isOptionSelected, selectedAction) in
            if isOptionSelected {  //Some Option have been selected
                print("Selected Price \(selectedAction.actionPrice!)")
            }
            if selectedTitle == "NO, THANKS" { //selectedButtonTitle
            }
            appBanner.dismissBanner()
            self.showSimpleAlert("\(selectedTitle) Button Clicked")
        }
        
        appBanner.setBannerTheme([UIColor.white], headerTextColor: UIColor.black)
        appBanner.setButtomTheme([UIColor.blue,UIColor(netHex:0x2375F8)], buttonTextColor: UIColor.white)
        
        appBanner.addAction(GLInAppAction(title: "10", subTitle: "Boosts", price: "₹155.00/ea", handler: { (actin) in
            print("Completion handler called \(actin.actionSubTitle!) For \(actin.actionPrice!)")
        }))
        
        appBanner.addAction(GLInAppAction(title: "5", subTitle: "Boosts", price: "₹184.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle!) For \(action.actionPrice!)")
        }))
        
        appBanner.addAction(GLInAppAction(title: "1", subTitle: "Boosts", price: "₹250.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle!) For \(action.actionPrice!)")
        }))
        appBanner.addAction(GLInAppAction(title: "6", subTitle: "Boosts", price: "₹184.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle!) For \(action.actionPrice!)")
        }))
        appBanner.addAction(GLInAppAction(title: "7", subTitle: "Boosts", price: "₹250.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle!) For \(action.actionPrice!)")
        }))
        
        
        appBanner.presentBanner()
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
