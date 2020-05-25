//
//  CollectionViewCell.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 19.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    let posterImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.black
        return image
    }()
    
    private func  posterImageContraints(){
        self.contentView.addSubview(posterImage)
        posterImage.layer.masksToBounds = true
        posterImage.layer.cornerRadius = 15.0
        posterImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
  /*  let movieNameLabel = UILabel()
    func setmovieNameLabel() {
        self.contentView.addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { (make) -> Void  in
            movieNameLabel.text = "Today"
            movieNameLabel.textColor = .white
            movieNameLabel.font = movieNameLabel.font.withSize(20)
            make.height.equalTo(25)
            make.top.equalTo(posterImage.snp.top).offset(5)
            make.leading.equalTo(posterImage.snp.leading).offset(5)
            
        }
    }*/
    
    let trailer : UIWebView = {
        let trailer = UIWebView()
        return trailer
    }()
    
    func setTrailer(){
        self.contentView.addSubview(trailer)
        trailer.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    /*   let starImage : UIImageView = {
     let image = UIImageView()
     image.backgroundColor = UIColor.black
     return image
     }()
     
     private func  starImageContraints(){
     self.contentView.addSubview(starImage)
     posterImage.snp.makeConstraints { (make) in
     make.top.equalTo(movieNameLabel.snp.bottom)
     make.leading.equalTo(posterImage.snp.leading).offset(5)
     make.height.equalTo(25)
     
     }
     }*/
    
    override init(frame : CGRect){
        super.init(frame : frame)
        posterImageContraints()
      //  setmovieNameLabel()
        // starImageContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
