//
//  BasicController.swift
//  MicroAppTest
//
//  Created by Honglin Yi on 8/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

public class BasicController: UIViewController {
    var activityImage: UIImage? = nil
    var activityName: String? = nil
    
    //MARK: UI
    private lazy var quitButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 14, y: 20, width: 37, height: 37))
        button.addTarget(self, action: #selector(quitAction(_:)), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "quit"), for: .normal)
        return button
    }()
    private lazy var launchV:MLaunchView = {
        let view = MLaunchView(frame: self.view.bounds)
        return view
    }()
    
    
    //MARK: Launch View n API
    func loadLaunchView() {
        self.launchV.setDatas(image: activityImage, title: activityName)
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
            self.unLoadLaunchView()
        }
    }
    func unLoadLaunchView() {
        self.launchV.dismiss()
    }
    
    //MARK: LifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.launchV)
        self.view.addSubview(self.quitButton)
    }
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override public func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.black
    }
    @objc func quitAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: Hide and unHide NaviBar n TabBar
    override public var prefersStatusBarHidden: Bool {
        return true
    }
    override public func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    override public func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
}



