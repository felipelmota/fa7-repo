//
//  City.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 03/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

public final class City {
    
    internal struct Keys {
        static let woeid = "woeid"
        static let district = "district"
        static let province = "province"
        static let state_acronym = "state_acronym"
        static let country = "country"
    }
    
    internal static var tableName = "cities"
    
    public let identifier: String?
    public let district: String
    public let province: String
    public let state_acronym: String
    public let country: String
    
    public init?(json: [String: Any]) {
        
        guard let identifier = json[Keys.woeid]! as? String,
            let district = json[Keys.district] as? String,
            let province = json[Keys.province] as? String,
            let state_acronym = json[Keys.state_acronym] as? String,
            let country = json[Keys.country] as? String else {
                return nil
        }
        
        self.identifier = identifier
        self.district = district
        self.province = province
        self.state_acronym = state_acronym
        self.country = country
    }
    
    public init(district: String,
                province: String,
                state_acronym: String,
                country: String) {
        
        self.identifier = nil
        self.district = district
        self.province = province
        self.state_acronym = state_acronym
        self.country = country
    }
    
    public class func array(jsonArray: [[String: Any]]) -> [City] {
        var ary: [City] = []
        for json in jsonArray {
            guard let city = City(json: json) else { continue }
            ary.append(city)
        }
        return ary
    }
}
