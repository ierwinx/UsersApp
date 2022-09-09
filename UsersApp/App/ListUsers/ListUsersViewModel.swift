import Combine
import Foundation
import UIKit

class ListUsersViewModel: ObservableObject {

    private let didChange = PassthroughSubject<ListUsersViewModel, Never>()
    
    @Published var arrUsers = [ListUsersUserModelResponse]() {
        willSet {
            didChange.send(self)
        }
    }
    
    init() {
        getUsers()
    }
    
    public func getUsers() {
        let arrhearders = [HeadersRequest(value: "application/json", key: "Content-Type")]
        BaseRequests.sendResponse(strUrl: URLs.listUsers, method: .GET, arrHeardes: arrhearders, objBody: EmptyObject()) { (objResp: ListUsersModelResponse?, error) in
            if error.code == 0, let arrdata = objResp?.data {
                self.arrUsers = arrdata
            } else {
                debugPrint(error)
            }
        }
    }
    
}
