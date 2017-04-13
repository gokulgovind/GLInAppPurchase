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

    @IBAction func Check(sender: AnyObject) {
        let appBanner = GLInAppPurchaseUI(title: "Skip The Line", subTitle: "Be first in the queue", bannerBackGroundStyle: .TransparentStyle)
        
        appBanner.displayContent(imageSetWithDescription:
            [
                UIImage(named:"IMG_1")!:"Rewind Your Last Swipe##Go back and swipe again",
                UIImage(named:"IMG_2")!:"",
                UIImage(named:"IMG_3")!:"Send More Super Likes##Let them know you are interested",
            ])
        appBanner.addButtonWith("BOOST ME", cancelTitle: "NO, THANKS") { (str) in
            print(str)
            if str == "NO, THANKS" {
            }
            appBanner.dismissBanner()
            self.showSimpleAlert("\(str) Button Clicked")
        }
        appBanner.setBannerTheme([UIColor.whiteColor()], headerTextColor: UIColor.blackColor())
        appBanner.setButtomTheme([UIColor.blueColor(),UIColor(netHex:0x2375F8)], buttonTextColor: UIColor.whiteColor())
        
        appBanner.addAction(GLInAppAction(title: "10", subTitle: "Boosts", price: "₹155.00/ea", handler: { (actin) in
            print("Completion handler called \(actin.actionSubTitle) Boost For \(actin.actionPrice)")
        }))
        
        appBanner.addAction(GLInAppAction(title: "5", subTitle: "Boosts", price: "₹184.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle) Boost For \(action.actionPrice)")
        }))
        
        appBanner.addAction(GLInAppAction(title: "1", subTitle: "Boosts", price: "₹250.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle) Boost For \(action.actionPrice)")
        }))
        appBanner.addAction(GLInAppAction(title: "6", subTitle: "Boosts", price: "₹184.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle) Boost For \(action.actionPrice)")
        }))
        appBanner.addAction(GLInAppAction(title: "7", subTitle: "Boosts", price: "₹250.00/ea", handler: { (action) in
            print("Completion handler called \(action.actionSubTitle) Boost For \(action.actionPrice)")
        }))
        
        
        appBanner.presentBanner()
    }
    
    func showSimpleAlert(message:String) {
        dispatch_async(dispatch_get_main_queue()) { 
            let alert = UIAlertController(title: "Completion Handler", message: message, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            self.navigationController?.presentViewController(alert, animated: true, completion: nil)
        }
       
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
