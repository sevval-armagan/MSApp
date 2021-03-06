//
//  SearchMoviesCollectionViewCell.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 9.06.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class SearchMoviesCollectionViewCell: UICollectionViewCell {
    
    override init(frame : CGRect){
         super.init(frame : frame)
         posterImageContraints()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     
     
     let posterImage : UIImageView = {
         let image = UIImageView()
        image.backgroundColor =  .black
         return image
     }()
     
     private func posterImageContraints(){
         self.contentView.addSubview(posterImage)
         posterImage.layer.masksToBounds = true
         posterImage.layer.cornerRadius = 15.0
         posterImage.snp.makeConstraints { (make) in
             make.centerX.equalToSuperview()
             make.centerY.equalToSuperview()
             make.height.equalTo(293)
             make.width.equalTo(195)
             
         }
     }
    override func awakeFromNib() {
         DispatchQueue.main.async {
             self.posterImage.layer.cornerRadius = 13.0
             self.posterImage.layer.shadowColor = UIColor.gray.cgColor
             self.posterImage.layer.shadowOpacity = 0.5
             self.posterImage.layer.shadowOpacity = 10.0
             self.posterImage.layer.shadowOffset = .zero
             self.posterImage.layer.shadowPath = UIBezierPath(rect: self.posterImage.bounds).cgPath
             self.posterImage.layer.shouldRasterize = true
         }
         
     }
     
    
    
}
