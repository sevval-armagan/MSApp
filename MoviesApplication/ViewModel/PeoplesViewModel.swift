//
//  PeoplesViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

protocol PeoplesViewModelDelegate{
    func requestCompleted2()
}

class PeoplesViewModel{
    var array = [PeoplesModel]()
    var delegate: PeoplesViewModelDelegate?
}

extension PeoplesViewModel{
    func getData22(){
        
        guard let gitUrl = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(PeoplesModel.self, from: data)
                self.array.append(gitData)
                self.delegate?.requestCompleted2()
            } catch let err {
                print("Err", err)
            }
        }.resume()
        
        
    }
}
