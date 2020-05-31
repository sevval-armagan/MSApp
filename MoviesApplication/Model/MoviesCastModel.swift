//
//  MoviesCastModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 31.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

struct MoviesCastModel : Codable {
let id : Int!
let cast : [Cast]!
let crew : [Crew]?
}

struct Cast : Codable {
let cast_id : Int?
let character : String?
let credit_id : String?
let gender : Int?
let id : Int?
let name : String?
let order : Int?
let profile_path : String?
}

struct Crew : Codable {
let credit_id : String?
let department : String?
let gender : Int?
let id : Int?
let job : String?
let name : String?
let profile_path : String?
}
