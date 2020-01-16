
import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Email is not valid", comment: "")
        case .unknownError:
            return NSLocalizedString("UnknownError", comment: "")
        case .serverError:
            return NSLocalizedString("ServerError", comment: "")
        }
    }
}
