import SwiftUI

struct LoginView: View {

    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
        VStack {
            
            UANavigationView(strTitle: "Login UsersApp")
            
            Spacer()
                .frame(height: 20)
            
            TextField("Email:", text: $loginViewModel.strUserName)
                .textFieldStyle(.roundedBorder)
                .padding()
                .font(.title3)
                .keyboardType(.emailAddress)
            
            SecureField("Contraseña:", text: $loginViewModel.strDrowssap)
                .textFieldStyle(.roundedBorder)
                .padding()
                .font(.title3)
            
            if let textError = loginViewModel.strError, textError != "" {
                Text(textError)
                    .font(.body)
                    .foregroundColor(Color("Rojo"))
            }
            
            Spacer()
            
            Button {
                loginViewModel.loginUser()
            } label: {
                Text("Login")
                    .font(.title2)
                    .padding(13)
                    .padding([.trailing, .leading], 80)
                    .background(Color("Verde"))
                    .foregroundColor(Color("Blanco"))
                    .cornerRadius(25)
            }.background {
                Spacer()
                ProgressView("Cargando...")
                    .tint(Color("Verde"))
                Spacer()
            }
            
            Spacer()
                .frame(height: 25)
        }
    }
}

struct LoginViewView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginViewModel())
    }
}
