import SwiftUI

struct UINavigationBack: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("<- Atras")
                .font(.title3)
                .foregroundColor(.white)
        }
    }
}

struct UINavigationBack_Previews: PreviewProvider {
    static var previews: some View {
        UINavigationBack()
    }
}
