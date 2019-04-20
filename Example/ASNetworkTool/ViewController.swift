//
//  ViewController.swift
//  ASNetworkTool
//
//  Created by 18354295998@sina.cn on 08/24/2018.
//  Copyright (c) 2018 18354295998@sina.cn. All rights reserved.
//

import UIKit
import ASNetworkTool
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        Book.as_request(api: .getBook, success: { (book) in
//            self.label.text = book.toJSONString()
//        }) { (info) in
//            self.label.text = info
//        }
        Book.request(api: XAPI.getBook, success: { (book) in
            self.label.text = book.toJSONString()
        }) { (info) in
//            self.label.text = info
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

