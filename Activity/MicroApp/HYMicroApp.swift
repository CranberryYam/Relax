//
//  HYMicroApp.swift
//  HYMicroApp
//
//  Created by Honglin Yi on 8/13/18.
//

import VasSonic

public struct HYMicroApp {
    public static let shared = HYMicroApp()
    
    public func activeInDelegate() {
        //register SonicURLProtocol
        URLProtocol.registerClass(SonicURLProtocol.self)
        //start web thread
        let webPool = UIWebView(frame: CGRect.zero)
        webPool.loadHTMLString("", baseURL: nil)
    }
}
