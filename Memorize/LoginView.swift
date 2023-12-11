import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isAuthenticated = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Realize o Login")
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Login") {
                    // Implement your authentication logic here
                    isAuthenticated = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top, 20)
                
                NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame()), isActive: $isAuthenticated) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
