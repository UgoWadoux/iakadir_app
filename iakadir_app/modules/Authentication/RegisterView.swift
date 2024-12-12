//
//  RegisterView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import SwiftUI
import Foundation



struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image("iakadir_mascotte") // Assurez-vous d'avoir cette image dans vos assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("Inscris-toi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Mot de passe", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Confirmer le mot de passe", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                Button(action:  {
                    print(email, password)
                    Task{
                        await AuthService().register(email: email, password: password)
                    }
                }) {
                    Text("S'inscrire")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.iakadirGreen))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                NavigationLink(destination: LoginView()) {
                    Text("Déjà un compte ? Connecte-toi")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
    
    
}


#Preview {
    RegisterView()
}
