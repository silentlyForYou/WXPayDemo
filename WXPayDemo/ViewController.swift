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

        let req = PayReq()
        req.partnerId = "1305176001"
        req.prepayId = "wx20160701091843d57d6a81430249267011"
        req.nonceStr = "4976980e192b8988394ec4e2e3bb5679"
        req.timeStamp = 1467335923
        req.package = "Sign=WXPay"
        req.sign = "26675BF331DBBE91D6B42D8B3E6F2237"
        
        WXApi.sendReq(req)
    }
}

