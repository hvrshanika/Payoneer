//
//  PayModeDisplay.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/24/21.
//

import Foundation

class PayMode: NSObject {
    var name: String
    var logoUrl: URL?
    
    init(with network: ApplicableNetwork) {
        self.name = network.label
        
        if let urls = network.links, let url = urls["logo"] {
            self.logoUrl = url
        }
    }
}

class GroupedPayMode: NSObject {
    var groupName: String
    var payModes: [PayMode]
    
    init(with name: String, modes: [PayMode]) {
        self.groupName = name
        self.payModes = modes
    }
}
