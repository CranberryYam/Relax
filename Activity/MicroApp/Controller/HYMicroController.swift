//
//  MicroController.swift
//  RelaxApp2
//
//  Created by Honglin Yi on 2/22/18.
//  Copyright © 2018 Honglin Yi. All rights reserved.
//

import UIKit
import WebKit
import VasSonic

public class HYMicroController: BasicController, SonicSessionDelegate, UIWebViewDelegate {
    
    private var webView:UIWebView!
    private var url:String!

    //MARK: Init n Deinit
    public init(aUrl: String, image: UIImage?, name: String?) {
        super.init(nibName: nil, bundle: nil)
        self.url = aUrl
        self.activityName = name
        self.activityImage = image
        reloadURL()
    }
    func reloadURL() {
        SonicEngine.shared().createSession(withUrl: self.url, withWebDelegate: self)
    }
    deinit {
        SonicEngine.shared().removeSession(withWebDelegate: self)
    }
    
    
    //MARK: Sonic
    public func session(_ session: SonicSession!, requireWebViewReload request: URLRequest!) {
        self.webView.loadRequest(request)
    }
    
    
    override public func loadView() {
        super.loadView()
        
        self.webView = UIWebView.init(frame: self.view.bounds)
        self.webView.delegate = self
        
        self.view = self.webView
        
        guard let url = URL(string: self.url) else {return}
        let request = URLRequest(url: url)

        if let session = SonicEngine.shared().session(withWebDelegate: self) {
            self.webView.loadRequest(SonicUtil.sonicWebRequest(with:session , withOrigin: request))
            SonicCache.share().cache(forSession: session.sessionID)
        } else {
            self.webView.loadRequest(request)
        }
    }
    
    
    //MARK: LaunchView
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        loadLaunchView()
    }    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        unLoadLaunchView()
    }
    
    
    //MARK: Init Boiler Plate
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

