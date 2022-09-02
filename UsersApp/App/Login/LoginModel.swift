import Foundation

struct LoginRequest: Encodable {
    let username: String
    let email: String
    let password: String
}

struct LoginResponse: Decodable {
    var token: String?
    var error: String?
}
