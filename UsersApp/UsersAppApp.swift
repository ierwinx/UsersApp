import SwiftUI

@main
struct UsersAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LoginViewModel())
        }
    }
}
