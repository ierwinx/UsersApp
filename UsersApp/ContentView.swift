import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login: LoginViewModel
    
    var body: some View {
        Group {
            if login.bShowUsers {
                ListUsersView()
            } else {
                LoginView()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LoginViewModel())
    }
}
