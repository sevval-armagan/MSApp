//
//  PeoplesCollectionViewCell.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 30.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class PeoplesCollectionViewCell: UICollectionViewCell {
    
    override init(frame : CGRect){
        super.init(frame : frame)
        peopleNameLabelContraints()
        peopleImageContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let peopleNameLabel : UILabel = {
        let label = UILabel()
        label.text = "asdasd"
        label.textColor = UIColor.brown
        return label
    }()
    
    private func peopleNameLabelContraints(){
        self.contentView.addSubview(peopleNameLabel)
        peopleNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    let peopleImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        return image
    }()
    
    private func peopleImageContraints(){
        self.contentView.addSubview(peopleImage)
        peopleImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
}

