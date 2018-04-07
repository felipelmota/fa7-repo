//
//  Period.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 04/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

public final class Period {
    
    internal struct Keys {
        static let id = "woeid"
        static let startDay = "start_day"
        static let endDay = "end_day"
    }
    
    public let identifier: String?
    public let startDay: String
    public let endDay: String
    
    public init?(json: [String: Any]) {
        
        guard let identifier = json[Keys.id] as? String,
            let startDay = json[Keys.startDay] as? String,
            let endDay = json[Keys.endDay] as? String else {
                return nil
        }
        
        self.identifier = identifier
        self.startDay = startDay
        self.endDay = endDay
    }
    
    public init(startDay: String, endDay: String) {
        
        self.identifier = nil
        self.startDay = startDay
        self.endDay = endDay
    }
    
    public class func array(jsonArray: [[String: Any]]) -> [Period] {
        var ary: [Period] = []
        for json in jsonArray {
            guard let period = Period(json: json) else { continue }
            ary.append(period)
        }
        return ary
    }
}
