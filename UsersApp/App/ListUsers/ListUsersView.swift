import SwiftUI

struct ListUsersView: View {
    
    @StateObject private var listUsersViewModel = ListUsersViewModel()
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                UANavigationView(strTitle: listUsersViewModel.arrUsers.isEmpty ? "Cargando..." : "Usuarios")
                
                if listUsersViewModel.arrUsers.isEmpty {
                    Spacer()
                    ProgressView("Descargando...")
                        .tint(Color("Verde"))
                    Spacer()
                } else {
                    
                    List(listUsersViewModel.arrUsers, id: \.id) { user in
                        
                        NavigationLink(destination: DetailUserView(idUser: user.id)) {
                            HStack {
                                Image("")
                                    .getImageFromWeb(strUrl: user.avatar)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("Verde"), lineWidth: 2))

                                Spacer()
                                    .frame(width: 20)

                                Text(user.firstName)
                                    .font(.title)
                            }
                            .padding()
                        }
                    }
                    .refreshable {
                        listUsersViewModel.getUsers()
                    }
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: UANavigationExit())
        }
        
    }
}

struct ListUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ListUsersView()
    }
}
