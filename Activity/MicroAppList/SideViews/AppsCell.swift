//
//  AppsCell.swift
//  RelaxApp2
//
//  Created by Honglin Yi on 2/27/18.
//  Copyright © 2018 Honglin Yi. All rights reserved.
//

import UIKit

class AppsCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor.white
    }
    func addDatas(_ imageUrl:String, _ name:String) {
//        if let image = UIImage(named: imageName) {
//            imageView.image = image
//        }
        nameL.text = name
    }
}
