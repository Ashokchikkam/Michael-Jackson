//
//  ItunesAPIClient.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
  
    typealias Results = [[String: Any]]
    
     func performRequest(with urlRequest: URLRequest, completion: @escaping (Results?, ItunesError?) -> Void) {
        
        let task = downloader.jsonTask(with: urlRequest) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let results = json["results"] as? [[String: Any]] else {
                    completion(nil, .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                
               // let songs = results.flatMap{ Song(json: $0) }
                
                completion(results, nil)
            }
        }
        
        task.resume()
        
        
    }
}

























