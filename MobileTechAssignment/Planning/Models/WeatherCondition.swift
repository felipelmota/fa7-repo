//
//  WeatherCondition.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 04/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

public final class WeatherCondition {
    
    internal struct Keys {
        static let id = "woeid"
        static let temperature = "temperature"
        static let weather = "weather"
        static let date = "date"
    }
    
    public let identifier: String?
    public let tempMax: String
    public let tempMin: String
    public let weather: String
    public let date: String
    
    public init?(json: [String: Any]) {
        
        guard let identifier = json[Keys.id]! as? String,
            let temperature = json[Keys.temperature] as? [String: Any],
            let weather = json[Keys.weather] as? String,
            let date = json[Keys.date] as? String else {
                return nil
        }
        
        self.identifier = identifier
        self.tempMax = String(describing: temperature["max"]!)
        self.tempMin = String(describing: temperature["min"]!)
        self.weather = weather
        self.date = date
    }
    
    public init(temperature: [String: Any],
                weather: String,
                date: String) {
        
        self.identifier = nil
        self.tempMax = temperature["max"] as! String
        self.tempMin = temperature["min"] as! String
        self.weather = weather
        self.date = date
    }
    
    public class func array(jsonArray: [[String: Any]]) -> [WeatherCondition] {
        var ary: [WeatherCondition] = []
        for json in jsonArray {
            guard let condition = WeatherCondition(json: json) else { continue }
            ary.append(condition)
        }
        return ary
    }
}
