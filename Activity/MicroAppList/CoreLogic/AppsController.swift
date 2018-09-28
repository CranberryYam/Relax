//
//  AppsController.swift
//  RelaxApp2
//
//  Created by Honglin Yi on 2/27/18.
//  Copyright © 2018 Honglin Yi. All rights reserved.
//

import UIKit


class AppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout,AppsView{
    
    private let Apps = "Apps"
    private let AppsHeader = "AppsHeader"
    private var appss = [AppsModel]()
    
    //MARK: Presenter Methods
    private var present = AppsPresenter()
    
    func freshView(appss: [AppsModel]) {
        self.appss = appss
        self.collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.isScrollEnabled = false
        setupConllectionView()
        self.present.view = self
        self.present.listenFeedChanges([AppsModel]())
    }
    //MARK: Controller Setup
    
    private lazy var layout:UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: -1, left: -1, bottom: 10, right: -1)
        let width = UIScreen.main.bounds.width + 3.0 + 2.0
        layout.itemSize = CGSize(width: width/4, height: width/4)
        layout.minimumInteritemSpacing = -1
        layout.minimumLineSpacing = 0
        return layout
    }()
    func setupConllectionView() {
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        
        let nib = UINib(nibName: "AppsHeaderView", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: AppsHeader)
        let nib2 = UINib(nibName: "AppsCell", bundle: nil)
        collectionView?.register(nib2, forCellWithReuseIdentifier: Apps)
        
       
        collectionView?.collectionViewLayout = layout
    }
    //MARK: HeaderView
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 40)
//    }
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headerView = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeader, for: indexPath)
//        headerView.frame = CGRect(x: 5, y: 0, width: UIScreen.main.bounds.width, height: 40.0)
//        return headerView
//    }
    // MARK: UICollectionView Methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appss.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Apps, for: indexPath) as! AppsCell
        let apps = appss[indexPath.item]
        cell.addDatas(imageName:apps.imageName, name:apps.name)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let apps = appss[indexPath.item]
        //ToDo: Jump to another controller
    }

}


