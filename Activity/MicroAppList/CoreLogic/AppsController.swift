//
//  AppsController.swift
//  RelaxApp2
//
//  Created by Honglin Yi on 2/27/18.
//  Copyright © 2018 Honglin Yi. All rights reserved.
//

import UIKit


class AppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout,AppsView{

    
    //MARK: Presenter Methods
    private var present = AppsPresenter()
    
    func freshView() {
        self.collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.isScrollEnabled = true
        setupConllectionView()
        self.present.view = self
        self.present.listenFeedChanges()
    }
    
    //MARK: Controller Setup
    private lazy var layout:UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        let width = (UIScreen.main.bounds.width - 3.0)/3
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        return layout
    }()
    func setupConllectionView() {
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        
        let nib = UINib(nibName: "AppsHeaderView", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "AppsHeader")
        let nib2 = UINib(nibName: "AppsCell", bundle: nil)
        collectionView?.register(nib2, forCellWithReuseIdentifier: "Apps")
        
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
        return present.appss.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Apps", for: indexPath) as! AppsCell
        let apps = present.appss[indexPath.item]
        cell.addDatas(apps.imageUrl, apps.name)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? AppsCell
        present.handleCellClick(indexPath.row, self, cell?.imageView.image)
    }

}


