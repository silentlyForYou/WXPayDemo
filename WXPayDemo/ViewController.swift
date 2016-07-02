//
//  ViewController.swift
//  WXPayDemo
//
//  Created by silently on 16/7/1.
//  Copyright © 2016年 silently. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func WXPayAction(sender: UIButton) {
        
        let urlString   = "http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios"
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: urlString)!)
        var response: NSURLResponse?
        
        do{
            let data:NSData? = try NSURLConnection.sendSynchronousRequest(request,
                                                                          returningResponse: &response)
            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            if str != nil {
                let dic = try! NSJSONSerialization.JSONObjectWithData(data!,
                                                                          options: NSJSONReadingOptions.MutableContainers)
                let req = PayReq()
                req.partnerId = dic["partnerid"] as? String ?? ""
//                req.partnerId = "1361206802"
                req.prepayId = dic["prepayid"] as? String ?? ""
                req.nonceStr = dic["noncestr"] as? String ?? ""
                req.timeStamp = UInt32(dic["timestamp"] as? Int ?? 0)
                //req.package = dic["package"] as? String ?? ""
                req.package = "Sign=WXPay"
                req.sign = dic["sign"] as? String ?? ""
//                req.sign = "v9DgHgTziClfgKzPhJI1ruVC1IHr8FxA"
                
                print("partid=\(req.partnerId)\nprepayid=\(req.prepayId)\nnoncestr=\(req.nonceStr)\ntimestamp=\(req.timeStamp)\npackage=\(req.package)\nsign=\(req.sign)");

                WXApi.sendReq(req)
            }
            
        }catch let error as NSError{
            //打印错误消息
            print(error.code)
            print(error.description)
        }
    }
}

