
import Foundation

class ErrorCheking {
    static func isFilled(firstName: String?, lastName: String?, email: String?, password: String?) -> Bool {
        guard !(firstName ?? "").isEmpty,
            !(lastName ?? "").isEmpty,
            !(email ?? "").isEmpty,
            !(password ?? "").isEmpty else {
                return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$" //присутствие знаков
        return check(text: email, RegEx: emailRegEx)
    }
    
    private static func check(text: String, RegEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluate(with: text)
    }
}
