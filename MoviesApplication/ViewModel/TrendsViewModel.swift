//
//  TrendsViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 31.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
import UIKit


protocol TrendsViewModelDelegate{
    func requestCompleted()
}

class TrendsViewModel{
    var array = [TrendsModel]()
    var delegate: TrendsViewModelDelegate?
}

class SeriesViewModel{
    var array1 = [SeriesModel]()
    var delegate: TrendsViewModelDelegate?
}



extension TrendsViewModel{
    func getData(){

        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=1218591a465b03f80cfebb0ef37a2275")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = try? Data(contentsOf: request.url!)
        
        do {
            let json = try? JSONDecoder().decode(TrendsModel.self, from: data!)
            array.append(json!)
        }
        self.delegate?.requestCompleted()
 
       
        
    }
    }

extension SeriesViewModel{
    func getDataSeries(){
           
           var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US&sort_by=popularity.desc&page=1&include_null_first_air_dates=false")!)
                         request.httpMethod = "GET"
                         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                  guard let data = try? Data(contentsOf: request.url!)else {return}
                         
                         do {
                          guard let json = try? JSONDecoder().decode(SeriesModel.self, from: data) else{return}
                              array1.append(json)
                         }
                         catch{
                          print("Error JsonDecode")
                  }
                  
              }
}
    
   



