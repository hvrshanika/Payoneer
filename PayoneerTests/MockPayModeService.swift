//
//  MockPayModeService.swift
//  PayoneerTests
//
//  Created by Shanika Vithanage on 5/30/21.
//

import Foundation
@testable import Payoneer

class MockPayModeService: PayModeServiceProtocol {
    var payModeResult: Result<Data> = .success(Data())
    
    func getAllPayModes(callback: @escaping (Result<Data>) -> Void) {
        callback(payModeResult)
    }
}
