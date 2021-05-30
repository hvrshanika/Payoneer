//
//  PayModeVM.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/22/21.
//

import Foundation

class PayModeVM: NSObject {
    
    private var payModeService: PayModeServiceProtocol
    private var networkList: [ApplicableNetwork]? {
        didSet {
            processNetworkList()
        }
    }
    
    // Binding
    let payModeList: Dynamic<[GroupedPayMode]> = Dynamic([GroupedPayMode]())
    let payModeListError: Dynamic<String> = Dynamic("")
    
    init(dataSource: PayModeServiceProtocol = PayModeService()) {
        self.payModeService = dataSource
    }
    
    func getAllPayModes() {
        payModeService.getAllPayModes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    if let resp = try? decoder.decode(ListResult.self, from: data) {
                        self.networkList = resp.networks.applicable
                    } else {
                        self.payModeListError.value = "Error occured while retrieving payment modes"
                    }
                case .failure(let message):
                    self.payModeListError.value = message
                }
            }
        }
    }
    
    private func processNetworkList() {
        var groupedList = [GroupedPayMode]()
        self.networkList?.forEach({ (network) in
            let existing = groupedList.filter { $0.groupName == network.grouping }
            // Append to list if there's existing record
            if existing.count > 0 {
                existing[0].payModes.append(PayMode(with: network))
            } else {
                groupedList.append(GroupedPayMode(with: network.grouping, modes: [PayMode(with: network)]))
            }
        })
        self.payModeList.value = groupedList.sorted { $0.groupName < $1.groupName }
    }
    
}
