import SwiftUI

struct UANavigationView: View {
    
    var strTitle: String
    
    var body: some View {
        ZStack {
            Color("Verde")
                .ignoresSafeArea(.all)
                .frame(height: 34)
            
            Spacer()
            
            Text(strTitle)
                .font(.title)
                .foregroundColor(Color("Blanco"))
                .bold()
                .padding(.leading, 10)
            
            Spacer()
            
        }
    }
}

struct UANavigationView_Previews: PreviewProvider {
    static var previews: some View {
        UANavigationView(strTitle: "Prueba")
    }
}
