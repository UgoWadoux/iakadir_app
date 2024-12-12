//
//  LoginView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 29/11/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var isPasswordVisible: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        if viewModel.isSuccess {
            HomeView()
        }else{
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
                            .foregroundColor(.white)
                        NavigationLink(destination: HomeView()){
                            Text("Inscris-toi")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.iakadirGreen)
                            
                        }
                    }
                    .padding(.top, 40)
                    
                    // Form
                    VStack(spacing: 1) {
                        // Email Field
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.iakadirGreen)
                            TextField("E-mail", text: $viewModel.email, prompt: Text("E-mail")
                                .foregroundColor(.iakadirBlack))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            .foregroundColor(.iakadirBlack)
                        }
                        .padding()
                        .background(
                            .white,
                            in: UnevenRoundedRectangle (
                                cornerRadii: .init(
                                    topLeading: 10,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 10
                                )
                            )
                        )
                        
                        // Password Field
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.iakadirGreen)
                            if isPasswordVisible {
                                TextField("Mot de passe", text: $viewModel.password, prompt: Text("Mot de passe")
                                    .foregroundColor(.iakadirBlack))
                                .foregroundColor(.iakadirBlack)
                            } else {
                                SecureField("Mot de passe", text: $viewModel.password, prompt: Text("Mot de passe")
                                    .foregroundColor(.iakadirBlack))
                                .foregroundColor(.iakadirBlack)
                            }
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(
                            .white,
                            in: UnevenRoundedRectangle (
                                cornerRadii: .init(
                                    topLeading: 0,
                                    bottomLeading: 10,
                                    bottomTrailing: 10,
                                    topTrailing: 0
                                )
                            )
                        )
                        
                    }
                    //Handle error message
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 8)
                    }
                    
                    // Login Button
                    Button(action:{
                        Task{
                            await  viewModel.login()
                        }
                    }) {
                        Text("Me connecter")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 16)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

// Preview
#Preview {
    LoginView()
}
