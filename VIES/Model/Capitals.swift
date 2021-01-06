//
//  Capitals.swift
//  VIES
//
//  Created by Master Family on 06/01/2021.
//

import Foundation
import MapKit

struct Capital: Identifiable, Hashable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
}

extension Capital {
    static let all: [Capital] = [
    
    ]
    
    static let vienna = Capital(latitude: 48.210033, longitude: 16.363449)
}
