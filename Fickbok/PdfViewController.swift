//
//  PdfViewController.swift
//  Fickbok
//
//  Created by Andreas Bom on 2015-07-21.
//  Copyright © 2015 Andreas Bom. All rights reserved.
//

import UIKit

class PdfViewController: UIViewController, UIWebViewDelegate {


    @IBOutlet weak var pdfViewer: UIWebView!
    

    var pdfRequest: NSURLRequest?
    
    var detailItem: String?{
        didSet {
            self.prepareForShowingSelectedDocument()
        }
        
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfViewer.delegate = self
        if pdfRequest != nil{
            
            self.pdfViewer.loadRequest(pdfRequest!)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func prepareForShowingSelectedDocument() {
        if let termsPath:String? = NSBundle.mainBundle().pathForResource(detailItem!, ofType: "pdf")!{
            let url = NSURL(fileURLWithPath: termsPath!)
            pdfRequest = NSURLRequest(URL: url)
        }
        
        
    }
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
