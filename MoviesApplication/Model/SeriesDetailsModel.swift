//
//  SeriesDetailsModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.06.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
struct Created_by : Codable {
    let id : Int?
    let credit_id : String?
    let name : String?
    let gender : Int?
    let profile_path : String?
}
struct SeriesGenres : Codable {
    let id : Int?
    let name : String?
}

struct SeriesDetailsModel : Codable {
    let backdrop_path : String?
    let created_by : [Created_by]?
    let episode_run_time : [Int]?
    let first_air_date : String?
    let genres : [SeriesGenres]?
    let homepage : String?
    let id : Int?
    let in_production : Bool?
    let languages : [String]?
    let last_air_date : String?
    let last_episode_to_air : Last_episode_to_air?
    let name : String?
    let next_episode_to_air : String?
    let networks : [Networks]?
    let number_of_episodes : Int?
    let number_of_seasons : Int?
    let origin_country : [String]?
    let original_language : String?
    let original_name : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let production_companies : [SeriesProduction_companies]?
    let seasons : [Seasons]?
    let status : String?
    let type : String?
    let vote_average : Double?
    let vote_count : Int?
}

struct Last_episode_to_air : Codable {
    let air_date : String?
    let episode_number : Int?
    let id : Int?
    let name : String?
    let overview : String?
    let production_code : String?
    let season_number : Int?
    let show_id : Int?
    let still_path : String?
    let vote_average : Int?
    let vote_count : Int?
}

struct Networks : Codable {
    let name : String?
    let id : Int?
    let logo_path : String?
    let origin_country : String?
}

struct SeriesProduction_companies : Codable {
    let id : Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?
}

struct Seasons : Codable {
    let air_date : String?
    let episode_count : Int?
    let id : Int?
    let name : String?
    let overview : String?
    let poster_path : String?
    let season_number : Int?
}
