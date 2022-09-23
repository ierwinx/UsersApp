import SwiftUI

struct UANavigationExit: View {
    
    @AppStorage("com.bugsoft.userapp.sessionToken") var sessionToken: String?
    
    var body: some View {
        Button {
            sessionToken = nil
        } label: {
            Text("Salir")
                .font(.title2)
                .tint(.white)
        }
    }
}

struct UANavigationExit_Previews: PreviewProvider {
    static var previews: some View {
        UANavigationExit()
    }
}
