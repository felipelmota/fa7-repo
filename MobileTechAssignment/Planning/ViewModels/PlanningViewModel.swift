//
//  PlanningViewModel.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 07/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

public final class PlanningViewModel {
    
    // MARK: - Instance Properties
//    public let city: City
//    public let weather: Weather
    public let city: String
    public let weather: [String]
    public let time: Int
//    public let period: Period
    
    // MARK: - Object Lifecycle
    public init(city: String, weather: [String], time: Int) {
        self.city = city
        self.weather = weather
        self.time = time
    }
}
