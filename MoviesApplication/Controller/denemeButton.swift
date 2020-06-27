//
//  denemeButton.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 4.06.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
import UIKit


class denemeButton : UIButton{
    
   override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
       }

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setup()
       }

    private func setup() {
         self.layer.cornerRadius = 10
         self.layer.masksToBounds = true
        self.backgroundColor = UIColor.red
        self.setTitleColor(.lightGray, for: .normal)
        self.layer.cornerRadius = 15
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        self.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
        self.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        self.setTitle("Watched", for: .normal)
       }
    
    
    
}
