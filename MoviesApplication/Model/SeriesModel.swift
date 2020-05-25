//
//  SeriesModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 20.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
struct SeriesModel : Codable {
let page : Int?
let total_results : Int?
let total_pages : Int?
let results : [seriesResults]?
}

struct seriesResults : Codable {
let original_name : String?
let genre_ids : [Int]?
let name : String?
let popularity : Double?
let origin_country : [String]?
let vote_count : Int?
let first_air_date : String?
let backdrop_path : String?
let original_language : String?
let id : Int?
let vote_average : Double?
let overview : String?
let poster_path : String?
}
