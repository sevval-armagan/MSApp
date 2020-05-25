//
//  TableViewCell.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 8.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
          let posterImage : UIImageView = {
              let image = UIImageView()
              image.backgroundColor = UIColor.black
              return image
          }()
          
          private func  posterImageContraints(){
              self.contentView.addSubview(posterImage)
              posterImage.snp.makeConstraints { (make) in
                  make.centerX.equalToSuperview()
                  make.centerY.equalToSuperview()
                  make.height.equalTo(450)
                  make.width.equalTo(300)
                  
              }
          }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
posterImageContraints()
        self.backgroundColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
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

