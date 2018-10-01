//
//  AppsPresenter.swift
//  RelaxApp3
//
//  Created by Honglin Yi on 3/7/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation
import UIKit

protocol AppsView:class {
    func freshView()
}

class AppsPresenter:NSObject {
    weak var view:AppsView?
    private(set) var appss = [AppsModel]()
    
    func listenFeedChanges() {
        getMockup()
        view?.freshView()
    }
    
    func handleCellClick(_ row: Int, _ controller: UIViewController,
                         _ image: UIImage?) {
        if(appss[row].controllerName == "Web") {
            controller.present(HYMicroController(aUrl: appss[row].htmlUrl, image: image, name: appss[row].name), animated: true, completion: nil)
        }
    }
}

fileprivate extension AppsPresenter {
     func getMockup() {
        var paras = [String:Any]()
        paras["htmlName"] = "relax"
        let apps1 = AppsModel(imageUrl: "", name: "Relax", controllerName: "Web", htmlUrl: "https://www.baidu.com")
        
        let apps2 =  AppsModel(imageUrl: "", name: "Record", controllerName: "Web", htmlUrl: "https://medium.com/s/story/stop-banking-on-a-breakthrough-microshifts-are-what-will-change-your-life-54add1467545")

        let apps3 = AppsModel(imageUrl: "", name: "Bike", controllerName: "Web", htmlUrl: "https://stackoverflow.com/questions/52583040/regex-with-any-number-with-space-or-dash")

        let apps4 = AppsModel(imageUrl: "", name: "Music", controllerName: "Web", htmlUrl: "https://mp.weixin.qq.com/s/4hXBw7sZ-NKs_asOQxS7gA")

        let apps5 = AppsModel(imageUrl: "", name: "Music", controllerName: "Web", htmlUrl: "https://mp.weixin.qq.com/s/8JVOwEw-UMEB4bRuBHRoSw")

        appss.append(apps1)
        appss.append(apps2)
        appss.append(apps3)
        appss.append(apps4)
        appss.append(apps5)
    }
}
