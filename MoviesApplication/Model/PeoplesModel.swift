//
//  PeoplesModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

struct PeoplesModel : Codable {
   let results : [ResultsPeople]?
    let page : Int?
    let total_results : Int?
    let dates : Dates?
    let total_pages : Int?
}

struct ResultsPeople : Codable {
   let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let poster_path : String?
    let id : Int?
    let adult : Bool?
    let backdrop_path : String?
    let original_language : String?
    let original_title : String?
    let genre_ids : [Int]?
    let title : String?
    let vote_average : Double?
    let overview : String?
    let release_date : String?

}

struct Dates : Codable {
   let maximum : String?
    let minimum : String?
}
