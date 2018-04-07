//
//  NetworkClient.swift
//  MobileTechAssignment
//
//  Created by Felipe Mota on 03/01/18.
//  Copyright © 2018 felipemota. All rights reserved.
//

import Foundation

public final class NetworkClient {
    
    // MARK: - Instance Properties
    internal let baseURL: URL
    internal let session = URLSession.shared
    
    public static let shared: NetworkClient = {
        let file = Bundle.main.path(forResource: "ServerEnvironments", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: file)!
        let urlString = dictionary["base_url"] as! String
        let url = URL(string: urlString)!
        return NetworkClient(baseURL: url)
    }()
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public func getCities(success _success: @escaping ([City]) -> Void,
                          failure _failure: @escaping (NetworkError) -> Void) {
        let success: ([City]) -> Void = { cities in
            DispatchQueue.main.async { _success(cities) }
        }
        let failure: (NetworkError) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        let url = baseURL.appendingPathComponent("cities/")
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode.isSuccessHTTPCode,
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data),
                let json = jsonObject as? [[String: Any]] else {
                    if let error = error {
                        failure(NetworkError(error: error))
                    } else {
                        failure(NetworkError(response: response))
                    }
                    return
            }
            
            let cities = City.array(jsonArray: json)
            success(cities)
        })
        
        task.resume()
    }
    
    public func getWeather(success _success: @escaping ([Weather]) -> Void,
                           failure _failure: @escaping (NetworkError) -> Void) {
        let success: ([Weather]) -> Void = { conditions in
            DispatchQueue.main.async { _success(conditions) }
        }
        let failure: (NetworkError) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        let url = baseURL.appendingPathComponent("weather/")
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode.isSuccessHTTPCode,
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data),
                let json = jsonObject as? [[String: Any]] else {
                    if let error = error {
                        failure(NetworkError(error: error))
                    } else {
                        failure(NetworkError(response: response))
                    }
                    return
            }
            
            let conditions = Weather.array(jsonArray: json)
            success(conditions)
        })
        
        task.resume()
    }
}
