//
//  DetailsViewController.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import UIKit
import Foundation

class DetailsViewController: UIViewController {
    
   
    @IBOutlet weak var webView: UIWebView!
    var commonUrl : String?
    


    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = URL (string: self.commonUrl ?? "")
              let requestObj = URLRequest(url: url!)
              webView.loadRequest(requestObj)
    }
    
}



