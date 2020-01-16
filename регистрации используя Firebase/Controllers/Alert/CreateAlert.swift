
import Foundation
import UIKit

class CreateAlert {
    
    class func createAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
