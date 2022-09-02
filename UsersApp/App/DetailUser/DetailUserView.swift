import SwiftUI

struct DetailUserView: View {
    
    var idUser: Int
    @StateObject var detailUserViewModel = DetailUserViewModel()
    
    var body: some View {
        VStack {
            
            UANavigationView(strTitle: detailUserViewModel.usuario?.firstName ?? "Cargando...")
            
            if detailUserViewModel.usuario == nil {
                Spacer()
                ProgressView("Descargando...")
                    .tint(Color("Verde"))
                Spacer()
            } else {
                
                Spacer()
                    .frame(height: 30)
                
                Image("")
                    .getImageFromWeb(strUrl: detailUserViewModel.usuario?.avatar ?? "")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("Verde"), lineWidth: 2))
                
                Spacer()
                    .frame(height: 30)
                
                
                HStack {
                    Text("Nombre: ")
                        .bold()
                        .padding()
                        .padding([.leading, .trailing], 5)
                    Text(detailUserViewModel.usuario?.firstName ?? "")
                        .font(.body)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Text("Apellidos: ")
                        .bold()
                        .padding()
                    Text(detailUserViewModel.usuario?.lastName ?? "")
                        .font(.body)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Text("Email: ")
                        .bold()
                        .padding()
                        .padding(.leading, 27)
                    Text(detailUserViewModel.usuario?.email ?? "")
                        .font(.body)
                        .padding()
                    Spacer()
                }
                
                Spacer()
            }
            
        }.onAppear {
            detailUserViewModel.getUser(idUser: idUser)
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: UINavigationBack(), trailing: UANavigationExit())
    }
}

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUserView(idUser: 1)
    }
}
