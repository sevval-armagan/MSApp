//
//  StackView.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 30.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
import UIKit

//TODO: Removing StackView elements
extension UIStackView {
    func removeAllSubviews() {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
}
