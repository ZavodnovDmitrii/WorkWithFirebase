
import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var errorButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: mailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateViewController(identifier: "PageViewController") as? PageViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
                CreateAlert.createAlert(title: "success", message: "You went to your page", vc: self)
            }
        }
    }
}
