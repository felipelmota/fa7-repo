//
//  Int+HTTPStatusCode.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 03/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

extension Int {
    public var isSuccessHTTPCode: Bool {
        return 200 <= self && self < 300
    }
}
