//
//  GenresCollectionViewCell.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame : CGRect){
           super.init(frame : frame)
           genresImageContraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       let genresImage : UIImageView = {
           let image = UIImageView()
           image.backgroundColor = UIColor.red
           return image
       }()
       
       private func  genresImageContraints(){
           self.contentView.addSubview(genresImage)
           genresImage.snp.makeConstraints { (make) in
               make.centerX.equalToSuperview()
               make.centerY.equalToSuperview()
               make.height.equalToSuperview()
               make.width.equalToSuperview()
               
           }
       }
       
}
