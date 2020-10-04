//
//  SampleData.swift
//  Card Viewer
//
//  Created by Valentin Silvera on 04.10.20.
//

import SwiftUI

struct City : Identifiable {
    var id: Int
    var image: String
    var title: String
}

var cities = {
    City(id: 0, image: "london", title: "London")
    City(id: 1, image: "ba", title: "Buenos Aires")
    City(id: 2, image: "nyc", title: "New York")
    City(id: 3, image: "berlin", title: "Berlin")
    City(id: 4, image: "sf", title: "San Francisco")
    City(id: 5, image: "paris", title: "Paris")
}
