//
//  HomePageModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 8.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
struct HomePageModel : Codable {
let page : Int?
let results : [HomePageResults]?
let total_pages : Int?
let total_results : Int?
}

struct HomePageResults : Codable {
let original_name : String?
let id : Int?
let name : String?
let vote_count : Int?
let vote_average : Double?
let first_air_date : String?
let poster_path : String?
let genre_ids : [Int]?
let original_language : String?
let backdrop_path : String?
let overview : String?
let origin_country : [String]?
let popularity : Double?
let media_type : String?
}
