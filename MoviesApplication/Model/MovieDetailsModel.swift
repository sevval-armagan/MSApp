//
//  MovieDetailsModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 27.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
struct MovieDetailsModel : Codable {
    let adult : Bool?
    let backdrop_path : String?
    let belongs_to_collection : Belongs_to_collection?
    let budget : Int?
    let genres : [Genres]?
    let homepage : String?
    let id : Int!
    let imdb_id : String?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let production_companies : [Production_companies]?
    let production_countries : [Production_countries]?
    let release_date : String?
    let revenue : Int?
    let runtime : Int?
    let spoken_languages : [Spoken_languages]?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int
    
}
struct Belongs_to_collection : Codable {
    let id : Int?
    let name : String?
    let poster_path : String?
    let backdrop_path : String?
}

struct Genres : Codable {
    let id : Int?
    let name : String?
}
struct Production_companies : Codable {
    let id : Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?
}
struct Production_countries : Codable {
    let iso_3166_1 : String?
    let name : String?
}
struct Spoken_languages : Codable {
    let iso_639_1 : String?
    let name : String?
}
