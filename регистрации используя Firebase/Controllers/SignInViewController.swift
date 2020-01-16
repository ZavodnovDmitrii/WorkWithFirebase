
import UIKit
import FirebaseAuth
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func signinButtonPressed(_ sender: Any) {
        NetWork.register(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: mailTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            case .success:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateViewController(identifier: "PageViewController") as? PageViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
                CreateAlert.createAlert(title: "success", message: "Yau are success register", vc: self)
            case .failure(let errors):
                CreateAlert.createAlert(title: "error", message: errors.localizedDescription, vc: self)
            }
        }
    }
}
