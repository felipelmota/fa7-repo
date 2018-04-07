//
//  HttpClient.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 02/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

class HttpClient {
    static let shared = HttpClient()
    
    private let session = URLSession.shared
    
    private init() {
        
    }
    
    func getDataFrom(_ url: String, callback: @escaping (_ data: Data?, _ error: Error?)->Void ) {
        guard let link = URL(string: url) else {
            let error = NSError(domain: "URL Error", code: 1, userInfo: nil)
            callback(nil, error)
            return
        }
        let request = URLRequest(url: link)
        let task = session.dataTask(with: request) {(data, response, error) in
            
            callback(data, error)
        }
        task.resume()
    }
}
