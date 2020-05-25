//
//  TrailersViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 23.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
protocol TrailersViewModelDelegate{
    func trailersRequestCompleted()
}

class TrailersViewModel{
    var trailersArray = [TrailersModel]()
    var delegate: TrailersViewModelDelegate?
}

extension TrailersViewModel{
    func getData(id : String){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/" + id + "/videos?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
               request.httpMethod = "GET"
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
               
               do {
                guard let json = try? JSONDecoder().decode(TrailersModel.self, from: data) else{return}
                    trailersArray.append(json)
               }
               catch{
                print("Error JsonDecode")
        }
        
    }
    
}
