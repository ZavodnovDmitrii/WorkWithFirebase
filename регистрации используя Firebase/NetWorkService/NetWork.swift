
import Foundation
import Firebase
import FirebaseAuth

class NetWork {
    
    enum AuthResult {
        case success
        case failure(Error)
    }
    
    class func register(firstName: String, lastName: String, email: String?, password: String?, completionBlock: @escaping (AuthResult) -> Void) {
        guard ErrorCheking.isFilled(firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    password: password) else {
                                        completionBlock(.failure(AuthError.notFilled))
                                        return
        }
        guard let email = email, let password = password else {
            completionBlock(.failure(AuthError.unknownError))
            return
        }
        guard ErrorCheking.isSimpleEmail(email) else {
            completionBlock(.failure(AuthError.invalidEmail))
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completionBlock(.failure(error!))
                return
            }
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: [
                "firstName": firstName,
                "lastName:": lastName,
                "uid": result.user.uid
            ]) { (error) in
                if error != nil {
                    completionBlock(.failure(AuthError.serverError))
                }
                print(result.user.uid)
                completionBlock(.success)
            }
        }
    }
}
