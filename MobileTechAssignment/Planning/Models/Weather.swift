//
//  Weather.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 03/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

public final class Weather {
    
    internal struct Keys {
        static let id = "id"
        static let name = "name"
    }
    
    internal static var tableName = "weathers"
    
    public let identifier: String?
    public let name: String
    
    public init?(json: [String: Any]) {
        
        guard let identifier = json[Keys.id] as? String,
            let name = json[Keys.name] as? String else {
                return nil
        }
        
        self.identifier = identifier
        self.name = name
    }
    
    public init(name: String) {
        
        self.identifier = nil
        self.name = name
    }
    
    public class func array(jsonArray: [[String: Any]]) -> [Weather] {
        var ary: [Weather] = []
        for json in jsonArray {
            guard let weather = Weather(json: json) else { continue }
            ary.append(weather)
        }
        return ary
    }
}
