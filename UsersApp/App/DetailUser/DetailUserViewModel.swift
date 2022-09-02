import Combine
import Foundation

class DetailUserViewModel: ObservableObject {

    private let didChange = PassthroughSubject<DetailUserViewModel, Never>()
    @Published var usuario: ListUsersUserModelResponse? {
        willSet {
            didChange.send(self)
        }
    }
    
    func getUser(idUser: Int) {
        let arrhearders = [HeadersRequest(value: "application/json", key: "Content-Type")]
        
        BaseRequests.sendResponse(strUrl: URLs.detailUser + "\(idUser)", method: .GET, arrHeardes: arrhearders, objBody: EmptyObject()) { (objResp: DetailUserModel?, error) in
            if error.code == 0, let data = objResp?.data {
                self.usuario = data
            } else {
                debugPrint(error)
            }
        }
    }
    
}
