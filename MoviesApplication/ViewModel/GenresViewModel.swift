//
//  GenresViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

protocol GenresViewModelDelegate{
    func requestCompleted()
}

class GenresViewModel{
    var array = [GenresModel]()
     var delegate: GenresViewModelDelegate?
}



extension GenresViewModel{
    func getData(){
        // parse işlemleri yapılacak
        
    }
}
