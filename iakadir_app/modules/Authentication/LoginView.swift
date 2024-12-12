//
//  LoginView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 29/11/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Curved lines background (similar to onboarding)
            ForEach(0..<8) { index in
                Circle()
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                    .scaleEffect(1.0 + Double(index) * 0.1)
            }
            // Content
            VStack(spacing: 32) {
                // Logo
                VStack {
                    Image(.iakadirMascotte)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Connecte-toi")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Tu n'as pas de compte ? ")
                        .font(.subheadline)
                        .foregroundColor(.white) +
                    Text("Inscris-toi")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.iakadirGreen))
                }
                .padding(.top, 40)

                // Form
                VStack(spacing: 0) {
                    // Email Field
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.iakadirGreen)
                        TextField("E-mail", text: $email, prompt: Text("E-mail")
                            .foregroundColor(.iakadirBlack))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            .foregroundColor(.iakadirBlack)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(0)
                    
                    
                    // Password Field
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(Color(.iakadirGreen))
                        if isPasswordVisible {
                            TextField("Mot de passe", text: $password, prompt: Text("Mot de passe")
                                .foregroundColor(.iakadirBlack))
                                .foregroundColor(.iakadirBlack)
                        } else {
                            SecureField("Mot de passe", text: $password, prompt: Text("Mot de passe")
                                .foregroundColor(.iakadirBlack))
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                }

                // Login Button
                NavigationLink(destination: HomeView()) {
                    Text("Me connecter")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(.top, 16)

                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1 // Skip #
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

// Preview
#Preview {
    LoginView()
}

#Preview {
    LoginView()
}
