//
//  APIConfig.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/22/21.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}

struct APIConfig {
        
    static func createRequest<T: Encodable>(forURL url: String, type: RequestType, data: T?) -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "content-type")
        
        var jsonStr = ""
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(data) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                jsonStr = jsonString
            }
        }
        
        if type == .post {
            request.httpBody = jsonStr.data(using: .utf8)
        }
        
        return request
    }
}

extension APIConfig {
    static func payModeListUrl() -> String! {
        return "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json"
    }
}
