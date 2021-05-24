//
//  PayModeService.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/22/21.
//

import Foundation

protocol PayModeServiceProtocol: Requestable {
    func getAllPayModes(callback: @escaping (Result<Data>) -> Void)
}

struct PayModeService: PayModeServiceProtocol {
    func getAllPayModes(callback: @escaping (Result<Data>) -> Void) {
        if let req = APIConfig.createRequest(forURL: APIConfig.payModeListUrl(), type: .get, data: String()) {
            request(request: req) { (result) in
                callback(result)
            }
        } else {
            callback(.failure("Error Occured while creating the request"))
        }
    }
}
