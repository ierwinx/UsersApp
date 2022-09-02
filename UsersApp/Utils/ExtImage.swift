import Foundation
import SwiftUI

extension Image {
    
    func getImageFromWeb(strUrl: String) -> Self {
        return BaseRequests.getImage(strURL: strUrl)
    }
    
}
