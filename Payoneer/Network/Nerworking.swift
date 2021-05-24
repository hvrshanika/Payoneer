//
//  Nerworking.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/22/21.
//

import Foundation

enum Result<Value: Decodable> {
    case success(Value)
    case failure(String)
}

protocol Requestable {}

extension Requestable {
    
    internal func request(request: URLRequest, indicator: Bool = true, callback: @escaping (Result<Data>) -> Void) {
        var activityIndicator: ActivityIndicator?
        
        if indicator {
            activityIndicator = ActivityIndicator()
            activityIndicator!.showActivityIndicator()
        }
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                callback(.failure(error.localizedDescription))
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    callback(.success(data!))
                } else {
                    callback(.failure("Error occured while retrieving data"))
                }
            }
            if activityIndicator != nil {
                activityIndicator!.hideActivityIndicator()
            }
        })
        task.resume()
    }
}
