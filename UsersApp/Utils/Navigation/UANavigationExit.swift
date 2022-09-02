import SwiftUI

struct UANavigationExit: View {
    var body: some View {
        Button {
            UserDefaults.standard.removeObject(forKey: "sessionToken")
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
