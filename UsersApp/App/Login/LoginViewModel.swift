import SwiftUI
import Combine
import Foundation

class LoginViewModel: ObservableObject {

    //MARK: - Variables
    private let didChange = PassthroughSubject<LoginViewModel, Never>()
    @Published var strUserName = "" { // eve.holt@reqres.in
        willSet {
            strError = ""
        }
    }
    @Published var strDrowssap = "" { // cityslicka
        willSet {
            strError = ""
        }
    }
    @Published var strError = "" {
        didSet {
            didChange.send(self)
        }
    }
    @Published var bShowUsers = false
    
    @AppStorage("com.bugsoft.userapp.sessionToken") var sessionToken: String?
    
    init() {
        if sessionToken != nil {
            bShowUsers = true
        } else {
            bShowUsers = false
        }
    }

    //MARK: - Public Methods
    public func loginUser() {
        let objSend = LoginRequest(username: strUserName, email: strUserName, password: strDrowssap)
        let arrhearders = [HeadersRequest(value: "application/json", key: "Content-Type")]
        BaseRequests.sendResponse(strUrl: URLs.login, method: .POST, arrHeardes: arrhearders, objBody: objSend) { (objResp: LoginResponse?, error) in
            if error.code == 0, let strToken = objResp?.token {
                self.bShowUsers = true
                self.sessionToken = strToken
            } else {
                self.bShowUsers = false
                self.strError = objResp?.error ?? ""
            }
        }
    }

}
