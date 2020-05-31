//
//  DateFormatter.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 29.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

extension String {
    func convertDatetring_TopreferredFormat(currentFormat: String, toFormat : String) ->  String {
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = currentFormat
        let resultDate = dateFormator.date(from: self)
        dateFormator.dateFormat = toFormat
        return dateFormator.string(from: resultDate!)
    }

}

