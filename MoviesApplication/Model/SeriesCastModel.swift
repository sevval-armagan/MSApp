//
//  SeriesCastModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 2.06.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
struct SeriesCastModel : Codable {
    let cast : [SeriesCast]?
    let crew : [SeriesCrew]?
    let id : Int?
}
struct SeriesCast : Codable {
    let character : String?
    let credit_id : String?
    let id : Int?
    let name : String?
    let gender : Int?
    let profile_path : String?
    let order : Int?
}
struct SeriesCrew : Codable {
    let credit_id : String?
    let department : String?
    let id : Int?
    let name : String?
    let gender : Int?
    let job : String?
    let profile_path : String?
}
