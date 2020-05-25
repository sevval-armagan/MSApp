//
//  HomePageViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 8.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
protocol HomePageViewModelDelegate{
    func homePagerequestCompleted()
}

class HomePageViewModel{
    var homePageArray = [HomePageModel]()
    var delegate: HomePageViewModelDelegate?
}

extension HomePageViewModel{
    func getData(){
        
         var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/trending/all/day?api_key=1218591a465b03f80cfebb0ef37a2275")!)
        
        request.httpMethod = "GET"
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
               let data = try? Data(contentsOf: request.url!)
               
               do {
                   let json = try? JSONDecoder().decode(HomePageModel.self, from: data!)
                   homePageArray.append(json!)
               }
        self.delegate?.homePagerequestCompleted()
    
        
    
    }
}
