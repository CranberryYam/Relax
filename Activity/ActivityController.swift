//
//  ActivityController.swift
//  Relax
//
//  Created by Honglin Yi on 9/30/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class ActivityController: UIViewController {
    let lengthRatio: CGFloat = UIScreen.main.bounds.height >= 812.0 ? 0.7 : 0.6//0.5253
    
    lazy var adView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * lengthRatio))
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var appView: UIView = {
        let controller = AppsController(collectionViewLayout: UICollectionViewFlowLayout())

        let y = UIScreen.main.bounds.width * lengthRatio
        let height = UIScreen.main.bounds.height - y
        let width = UIScreen.main.bounds.width

        controller.view.frame = CGRect(x: 0, y: y, width: width, height: height)
        self.addChildViewController(controller)
        
        return controller.view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(adView)
        self.view.addSubview(appView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
