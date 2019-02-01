//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Philipp Hackbarth on 19.09.18.
//  Copyright © 2018 Hackbarth GFX. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: path)
            let request = URLRequest(url: url)
            
            webView.load(request)
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
