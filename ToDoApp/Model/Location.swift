//
//  Location.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    var dict: [String : Any] {
        var dict: [String : Any] = [:]
        dict["name"] = name
        if let coordinate = coordinate {
            dict["latitude"] = coordinate.latitude
            dict["longitude"] = coordinate.longitude
        }
        return dict
    }
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location {
    typealias PlistDictionaty = [String : Any]
    init?(dict: PlistDictionaty) {
        self.name = dict["name"] as! String
        if
            let latitude = dict["latitude"] as? Double,
            let longitude = dict["longitude"] as? Double {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = nil
        }
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude && rhs.coordinate?.longitude == lhs.coordinate?.longitude else { return false}
        return true
    }
}
