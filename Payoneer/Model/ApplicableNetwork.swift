// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.
import Foundation

class ApplicableNetwork: NSObject, Decodable {
    /// Payment network code.
    let code: String
    
    /// Display label of the payment network.
    let label: String
    
    /// Grouping code; helps to group several payment networks together while displaying them on payment page (e.g. credit cards).
    let grouping: String
    
    /// Collection of links related to this payment network in scope of the `LIST` session
    let links: [String: URL]?
}
