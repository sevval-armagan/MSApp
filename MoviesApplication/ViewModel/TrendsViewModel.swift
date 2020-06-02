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
protocol SeriesDetailsViewModelDelegate{
    func requestCompleted()
}

protocol MovieDetailsViewModelDelegate{
    func requestCompleted76()
}
protocol MoviesCastViewModelDelegate{
    func requestCompleted()
}
protocol SeriesCastViewModelDelegate{
    func requestCompleted()
}
//-----------------------------------------//
class TrendsViewModel{
    var array = [TrendsModel]()
    var delegate: TrendsViewModelDelegate?
}

class SeriesViewModel{
    var seriesArray = [SeriesModel]()
    var delegate: TrendsViewModelDelegate?
}

class MovieDetailsViewModel{
    var moviesDetailsArray = [MovieDetailsModel]()
    var delegate: MovieDetailsViewModelDelegate?
}
class SeriesDetailsViewModel{
    var seriesDetailsArray = [SeriesDetailsModel]()
    var delegate: SeriesDetailsViewModelDelegate?
}
class MoviesCastViewModel{
    var moviesCastArray = [MoviesCastModel]()
    var delegate: MoviesCastViewModelDelegate?
}

class SeriesCastViewModel{
    var seriesCastArray = [SeriesCastModel]()
    var delegate: MoviesCastViewModelDelegate?
}

extension TrendsViewModel{
    func getData(){
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1")!)
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


extension MovieDetailsViewModel{
    
    func getDataMovieDetails( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/" + id + "?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(MovieDetailsModel.self, from: data) else{return}
            moviesDetailsArray.append(json)
            
        }
        
        completed()
        self.delegate?.requestCompleted76()
        
    }
}



extension MoviesCastViewModel{
    
    func getMoviesCast( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/" + id + "/credits?api_key=1218591a465b03f80cfebb0ef37a2275")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(MoviesCastModel.self, from: data) else{return}
            moviesCastArray.append(json)
        }
        
        completed()
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
            seriesArray.append(json)
        }
        
        self.delegate?.requestCompleted()
        
    }
}

extension SeriesDetailsViewModel{
    
    func getDataSeriesDetails( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/tv/" + id + "?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(SeriesDetailsModel.self, from: data) else{return}
            seriesDetailsArray.append(json)
            
        }
        
        completed()
        self.delegate?.requestCompleted()
        
    }
}





extension SeriesCastViewModel{
    
    func getMoviesCast( id: String,completed: @escaping () -> ()) {
        
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/tv/" "/credits?api_key=1218591a465b03f80cfebb0ef37a2275&language=en-US")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? Data(contentsOf: request.url!)else {return}
        
        do {
            guard let json = try? JSONDecoder().decode(SeriesCastModel.self, from: data) else{return}
            seriesCastArray.append(json)
        }
        
        completed()
        self.delegate?.requestCompleted()
        
    }
}
