import Foundation

struct ListUsersModelResponse: Decodable {
    
    let page: Int
    let totalPages: Int
    let data: [ListUsersUserModelResponse]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case data
    }
    
}

struct ListUsersUserModelResponse: Decodable {
    
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
        case email
    }
    
}
