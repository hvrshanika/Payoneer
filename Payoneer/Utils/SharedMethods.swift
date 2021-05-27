//
//  SharedMethods.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/27/21.
//

import UIKit

class SharedMethods: NSObject {
    
    class func showMessage(_ title: String?, message msg: String?, onVC viewController: UIViewController?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel, handler: {(_ action: UIAlertAction?) -> Void in
            alert.dismiss(animated: true) {() -> Void in }
        })
        alert.addAction(cancel)
        viewController?.present(alert, animated: true) {() -> Void in }
    }
}
