//
//  AppsPresenter.swift
//  RelaxApp3
//
//  Created by Honglin Yi on 3/7/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation

protocol AppsView:class {
    func freshView(appss:[AppsModel])
}

class AppsPresenter:NSObject {
    weak var view:AppsView?
    private var appss = [AppsModel]()
    
    func listenFeedChanges(_ viewModel:[AppsModel]) {
        getMockup()
        view?.freshView(appss: appss)
    }
}

fileprivate extension AppsPresenter {
     func getMockup() {
        var paras = [String:Any]()
        paras["htmlName"] = "relax"
        let apps1 = AppsModel(imageName: "lifestyle", name: "Relax", controllerName: "Micro", params: paras)
        
        let apps2 = AppsModel(imageName: "Food", name: "Record", controllerName: "Record", params: nil)
        let apps3 = AppsModel(imageName: "bike", name: "Bike", controllerName: "Record", params: nil)
        let apps4 = AppsModel(imageName: "music", name: "Music", controllerName: "Record", params: nil)
        let apps5 = AppsModel(imageName: "music", name: "Music", controllerName: "Record", params: nil)
        appss.append(apps1)
        appss.append(apps2)
        appss.append(apps3)
        appss.append(apps4)
        appss.append(apps5)
    }
}
