import Foundation

struct HeadersRequest {
    let value: String
    let key: String
    
    init(value: String, key: String) {
        self.value = value
        self.key = key
    }
}
