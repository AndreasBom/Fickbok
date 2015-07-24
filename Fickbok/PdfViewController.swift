//
//  PdfViewController.swift
//  Fickbok
//
//  Created by Andreas Bom on 2015-07-21.
//  Copyright © 2015 Andreas Bom. All rights reserved.
//

import UIKit

class PdfViewController: UIViewController {


    @IBOutlet weak var pdfViewer: UIWebView!
    var pdfRequest: NSURLRequest?
    
    var detailItem: String?{
        didSet {
            self.prepareForShowingSelectedDocument()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.prepareForShowingSelectedDocument()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
