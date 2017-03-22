//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by James Liu on 22/3/17.
//  Copyright © 2017 James Liu. All rights reserved.
//

import UIKit
import WebKit
import CoreLocation


class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.bignerdranch.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}
