import Foundation
import SwiftUI

class BaseRequests {
    
    private static let ownError: NSError = NSError(domain: "BaseRequests", code: -1, userInfo: nil)
    
    public static func sendResponse<E: Encodable, T: Decodable>(strUrl: String, method: MethodRequest, arrHeardes: [HeadersRequest]? = [], objBody: E, handler: @escaping (_ objResp: T?, NSError) -> ()) {
        
        DispatchQueue.global(qos: .utility).async {
            guard let endpoint: URL = URL(string: URLs.domain + strUrl) else {
                return
            }
            
            var request = URLRequest(url: endpoint)
            
            arrHeardes?.forEach() { headersCon in
                request.setValue(headersCon.value, forHTTPHeaderField: headersCon.key)
            }
            
            request.httpMethod = method.rawValue
            
            if !(objBody is EmptyObject), let body = try? JSONEncoder().encode(objBody) {
                request.httpBody = body
            }
            
            let tarea = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.sync {
                    if let errorNS = error as NSError? {
                        handler(nil, errorNS)
                    }
                    
                    guard let dataRes = data, let objRes = try? JSONDecoder().decode(T.self, from: dataRes) else {
                        handler(nil, self.ownError)
                        return
                    }
                    
                    handler(objRes, NSError(domain: "BaseRequests", code: 0, userInfo: nil))
                }
            }
            
            tarea.resume()
        }
        
    }
    
    public static func getImage(strURL: String) -> Image {
        let imgNotFound = Image(uiImage: UIImage(named: "notFound")!)
        
        guard let endpoint: URL = URL(string: strURL),
              let data = try? Data(contentsOf: endpoint),
              let imgData = UIImage(data: data) else {
            return imgNotFound
        }
        
        return Image(uiImage: imgData)
    }
    
}
